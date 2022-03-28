terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

#  backend "s3" {}
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}