# First ECS Service for Microservice 1
module "ecs_microservice1" {
  source              = "../../../modules/ecs"
  cluster_name        = "my-ecs-cluster"
  family              = "microservice1"  # Task definition family name for microservice 1
  container_definitions = file("container_definitions_microservice1.json")  # Path to the container definitions for microservice 1
  memory              = 512
  cpu                 = 256
  execution_role_arn  = aws_iam_role.ecs_task_execution_role.arn
  service_name        = "service1"
  desired_count       = 1
  subnet_ids          = module.vpc.public_subnet_ids
  security_groups     = [module.vpc.ecs_security_group_id]
}

# Second ECS Service for Microservice 2
module "ecs_microservice2" {
  source              = "../../../modules/ecs"
  cluster_name        = "my-ecs-cluster"
  family              = "microservice2"  # Task definition family name for microservice 2
  container_definitions = file("container_definitions_microservice2.json")  # Path to the container definitions for microservice 2
  memory              = 512
  cpu                 = 256
  execution_role_arn  = aws_iam_role.ecs_task_execution_role.arn
  service_name        = "service2"
  desired_count       = 1
  subnet_ids          = module.vpc.public_subnet_ids
  security_groups     = [module.vpc.ecs_security_group_id]
}


resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

