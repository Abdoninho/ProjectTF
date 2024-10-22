variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "target_instances" {
  type = list(string)
}

variable "lb_security_group" {
  type = string
}