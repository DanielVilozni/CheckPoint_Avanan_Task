provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name               = var.vpc_name
  cidr               = var.cidr
  azs                = [var.az_1, var.az_2]
  public_subnets     = [var.public_subnet_1, var.public_subnet_2]
  private_subnets    = [var.private_subnet_1, var.private_subnet_2]
  enable_nat_gateway = true
  single_nat_gateway = true
}



resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  vpc_id      = module.vpc.vpc_id  # Use the VPC ID from the module
  description = "Allow traffic for ECS services"

  # Allow inbound traffic from anywhere on port 80 (HTTP)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic from anywhere on port 443 (HTTPS)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
