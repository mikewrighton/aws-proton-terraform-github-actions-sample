/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:259837135622:component/test-component

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:279245132597:component/component-1

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
provider "aws" {}

variable "aws_region" {
  type = string
}

resource "aws_ssm_parameter" "component-test" {
  name  = "component-test"
  type  = "String"
  value = "my-test-value"
}
