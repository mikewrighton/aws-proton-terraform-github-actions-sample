/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-northeast-1:259837135622:service/apigw-lambda-svc-cli/service-instance/main

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "sns_publish_policy_document" {
  statement {
    actions = [
      "sns:Publish"
    ]
    resources = [
      var.environment.outputs.SnsTopicArn
    ]
  }
}

data "archive_file" "lambda_zip_inline" {
  type        = "zip"
  output_path = "lambda_zip_inline.zip"

  source {
    filename = "index.js"
    content  = <<EOF
        exports.handler = async (event, context) => {
          try {
            // Log event and context object to CloudWatch Logs
            console.log("Event: ", JSON.stringify(event, null, 2));
            console.log("Context: ", JSON.stringify(context, null, 2));
            // Create event object to return to caller
            const eventObj = {
              functionName: context.functionName,
              rawPath: event.rawPath,
            };
            const response = {
              statusCode: 200,
              body: JSON.stringify(eventObj, null, 2),
            };
            return response;
          } catch (error) {
            console.error(error);
            throw new Error(error);
          }
        };
EOF
  }
}