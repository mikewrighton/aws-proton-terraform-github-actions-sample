/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-northeast-1:259837135622:service/svc-comps/service-instance/i

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.id
  partition  = data.aws_partition.current.id
}

variable "task_size_cpu" {
  type = map(string)
  default = {
    "x-small" = "256"
    "small"   = "512"
    "medium"  = "1024"
    "large"   = "2048"
    "x-large" = "4096"
  }
}

variable "task_size_memory" {
  type = map(string)
  default = {
    "x-small" = "512"
    "small"   = "1024"
    "medium"  = "2048"
    "large"   = "4096"
    "x-large" = "8192"
  }
}