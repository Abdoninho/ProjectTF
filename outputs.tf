output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = module.subnets.public_subnet_ids
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = module.subnets.private_subnet_ids
}
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}

output "bastion_host" {
  description = "The ID of the Bastion Host"
   value = module.bastion.bastion_instance_id
}

output "nginx_instances" {
  description = "The IDs of the NGINX instances"
  value       = module.nginx.instance_ids
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer"
  value = module.load_balancer.dns_name

}