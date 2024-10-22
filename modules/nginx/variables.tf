variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair to SSH into the instance"
  type        = string
}

variable "nginx_ami" {
  description = "The AMI ID for the NGINX instances"
  type        = string
}
variable "instance_type" {
  description = "Instance type for the NGINX server"
  type        = string
  default     = "t2.micro"  
}