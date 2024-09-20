variable "aws_region" {
  description = "AWS region to deploy the resources"
  default     = "eu-west-1"
	type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
	type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
	type        = string
}

variable "ssh_key_path" {
  description = "The path to the SSH public key file"
	type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block to allow SSH access"
	type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to run"
	type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
	type        = string
}

variable "github_repo" {
  description = "Github repo to clone"
	type        = string
}
