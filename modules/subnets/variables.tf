variable "vpc_id" {
  description = "The VPC ID"
  type = string
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}