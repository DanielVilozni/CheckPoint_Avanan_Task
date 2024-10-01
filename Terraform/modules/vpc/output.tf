output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}















