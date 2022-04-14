/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:259837135622:service/apigw_lambda_svc/service-instance/i1

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "terraform-samples-259837135622-apigw-lambda-svc"
    key    = "instance.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = data.aws_region.current.id
  alias  = "default"

  default_tags {
    tags = {
      "proton:service" = var.service.name
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}