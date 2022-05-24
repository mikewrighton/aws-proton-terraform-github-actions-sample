/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-northeast-1:259837135622:component/s3-bucket

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {}
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  alias  = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = "component-bucket"
}

data "aws_iam_policy_document" "s3_bucket_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject"
    ]
    resources = [
      aws_s3_bucket.s3_bucket.arn
    ]
  }
}

resource "aws_iam_policy" "s3_bucket_policy" {
  policy = data.aws_iam_policy_document.s3_bucket_policy_document.json
}

output "BucketArn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "BucketAccessPolicyArn" {
  value = aws_iam_policy.s3_bucket_policy.arn
}