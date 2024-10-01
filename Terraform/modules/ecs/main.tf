# ECS Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# ECS Task Definition
resource "aws_ecs_task_definition" "microservice" {
  family                   = var.family
  network_mode             = "awsvpc"
  container_definitions    = var.container_definitions
  requires_compatibilities = ["FARGATE"]
  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
}

# ECS Service
resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.microservice.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.subnet_ids
    security_groups = var.security_groups
    assign_public_ip = true
  }
}