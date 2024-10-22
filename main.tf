provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "subnets" {
  source          = "./modules/subnets"
  vpc_id          = module.vpc.vpc_id
  public_cidrs    = var.public_subnet_cidrs
  private_cidrs   = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
}

module "bastion" {
  source      = "./modules/bastion"
  vpc_id      = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_ids[0]
  key_name    = var.bastion_key_name
}

module "nginx" {
  source        = "./modules/nginx"
   nginx_ami    = var.nginx_ami
  #vpc_id        = module.vpc.vpc_id
  private_subnets = module.subnets.private_subnet_ids
  key_name      = var.nginx_key_name
  instance_type = "t2.micro"
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source            = "./modules/load-balancer"
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.subnets.public_subnet_ids
  target_instances  = module.nginx.instance_ids
  lb_security_group = var.lb_security_group
}