variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "bastion_key_name" {
  description = "Key pair name for the bastion host"
  type        = string
   default     = "Bastion_key"
}

variable "nginx_key_name" {
  description = "Key pair name for NGINX instances"
  type        = string
   default     = "Nginx_key"
   
}
variable "nginx_ami" {
  description = "The AMI ID to use for NGINX instances"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "lb_security_group" {
  description = "Security group ID for the load balancer"
  type       = string
  default     = "sg-08a132702b207fd29"
}
