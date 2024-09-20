terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
}

module "security_groups" {
  source           = "./modules/security_groups"
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

resource "aws_key_pair" "deployer" {
  key_name   = "new-ec2-key"
  public_key = file("/Users/box/.ssh/new-ec2-key.pub")
}

module "ec2_instances" {
  source            = "./modules/ec2_instances"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_groups.security_group_id
  key_name          = aws_key_pair.deployer.key_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
}

output "ec2_instance_public_ip" {
  value = module.ec2_instances.public_instance_ip
}
