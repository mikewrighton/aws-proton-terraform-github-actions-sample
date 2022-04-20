/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-northeast-1:259837135622:environment/fargate-env-nrt

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  cidr = var.environment.inputs.vpc_cidr

  azs                  = ["${var.aws_region}a"]
  private_subnets      = [var.environment.inputs.private_subnet_one_cidr, var.environment.inputs.private_subnet_two_cidr]
  public_subnets       = [var.environment.inputs.public_subnet_one_cidr, var.environment.inputs.public_subnet_two_cidr]
  enable_nat_gateway   = true
  enable_vpn_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = var.environment.name
  }
}

resource "aws_service_discovery_private_dns_namespace" "service_discovery" {
  name        = "${var.environment.name}.local"
  description = ""
  vpc         = module.vpc.vpc_id
}

resource "aws_sns_topic" "ping_topic" {
  name              = "${var.environment.name}-ping"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_ecs_cluster" "fargate_cluster" {
  name = "${var.environment.name}-Cluster"
  capacity_providers = [
    "FARGATE"
  ]
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "service_task_definition_execution_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}