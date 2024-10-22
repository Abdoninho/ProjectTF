variable "vpc_id" {
  description = "The VPC ID to associate the Internet Gateway with"
  type        = string
}

variable "public_subnet_ids" {
  description = "The list of public subnet IDs"
  type        = list(string)
}