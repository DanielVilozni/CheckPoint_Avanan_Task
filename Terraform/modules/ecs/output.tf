output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.microservice.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.this.name
}






output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "microservice1_task_definition" {
  value = aws_ecs_task_definition.microservice1.arn
}

output "microservice2_task_definition" {
  value = aws_ecs_task_definition.microservice2.arn
}
