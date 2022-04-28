/*
This file is no longer managed by AWS Proton. The associated resource has been deleted in Proton.
*/

resource "aws_ssm_parameter" "my_ssm_parameter" {
  name  = "my_ssm_parameter"
  type  = "String"
  value = var.service_instance.inputs.my_sample_service_instance_required_input
}
