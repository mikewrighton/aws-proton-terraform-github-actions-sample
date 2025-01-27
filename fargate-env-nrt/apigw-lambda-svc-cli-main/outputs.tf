/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-northeast-1:259837135622:service/apigw-lambda-svc-cli/service-instance/main

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

#output "HttpApiEndpoint" {
#  description = "The default endpoint for the HTTP API."
#
#  value = aws_apigatewayv2_stage.lambda.invoke_url
#}
#
#output "LambdaRuntime" {
#  value = var.service_instance.inputs.lambda_runtime
#}

output "ApplicationLogs" {
  value = "https://ap-northeast-1.console.aws.amazon.com/cloudwatch/home?region=ap-northeast-1#logsV2:log-groups/log-group/$252Faws$252Fapi_gw$252Fapigw-lambda-svc-cli"
}

output "CPUUtilizationAlarm" {
  value = "https://ap-northeast-1.console.aws.amazon.com/cloudwatch/home?region=ap-northeast-1#alarmsV2:alarm/TargetTracking-service$2Ffargate-env-nrt-Cluster$2Fbackend-fargate-svc_instance-1-AlarmHigh-5492c823-3c04-4ae0-a3f5-f7cc2b23cb53?"
}

output "MemoryUtilizationAlarm" {
  value = "https://ap-northeast-1.console.aws.amazon.com/cloudwatch/home?region=ap-northeast-1#alarmsV2:alarm/TargetTracking-service$2Ffargate-env-nrt-Cluster$2Fbackend-fargate-svc_instance-1-AlarmLow-a171f1c5-d5ce-4cdd-8811-d7ce3fdb021d?"
}
