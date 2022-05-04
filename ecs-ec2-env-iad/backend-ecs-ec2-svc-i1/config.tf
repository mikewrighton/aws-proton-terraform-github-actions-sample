/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:259837135622:service/backend-ecs-ec2-svc/service-instance/i1

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }

  backend "s3" {
    bucket = "racicot-arrow-testing"
    region = "us-east-1"
    key    = "scheduled-ecs-ec2-svc.state"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      service = var.service.name
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}