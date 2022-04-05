/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:259837135622:environment/vpc-ecs-environment

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

output "VpcId" {
  value = module.vpc.vpc_id
}

output "PublicSubnet1" {
  value = module.vpc.public_subnets[0]
}

output "PublicSubnet2" {
  value = module.vpc.public_subnets[1]
}

output "PrivateSubnet1" {
  value = module.vpc.private_subnets[0]
}

output "PrivateSubnet2" {
  value = module.vpc.private_subnets[1]
}

output "SnsTopicArn" {
  value = module.sns.sns_topic_arn
}

output "SnsTopicName" {
  value = module.sns.sns_topic_name
}

output "VpcSecurityGroup" {
  value = module.vpc.default_security_group_id
}
