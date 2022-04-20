/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:259837135622:service/apigw-lambda-svc-cli/pipeline

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

variable "service_instances" {
  type = list(
    object({
      name    = string
      inputs  = map(string)
      outputs = map(string)
      environment = object({
        account_id = string
        name       = string
        outputs    = map(string)
      })
    })
  )
}

variable "service" {
  type = object({
    name = string
  })
  default = null
}

variable "pipeline" {
  type = object({
    inputs = map(string)
  })
  default = null
}

