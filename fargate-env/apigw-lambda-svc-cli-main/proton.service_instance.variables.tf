/*
This file is no longer managed by AWS Proton. The associated resource has been deleted in Proton.
*/

variable "environment" {
  type = object({
    account_id = string
    name       = string
    outputs    = map(string)
  })
  default = null
}

variable "service" {
  type = object({
    name = string
  })
}

variable "service_instance" {
  type = object({
    name   = string
    inputs = map(string)
  })
  default = null
}

