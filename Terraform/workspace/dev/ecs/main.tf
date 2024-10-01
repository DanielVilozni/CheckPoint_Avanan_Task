module "ecs" {
  source              = "../../../modules/ecs"
  cluster_name        = "my-ecs-cluster"
  family              = "my-microservice"
  container_definitions = file("container_definitions.json")  # Path to the container_definitions
  memory              = 512
  cpu                 = 256
  execution_role_arn  = aws_iam_role.ecs_task_execution_role.arn  # IAM role for the task execution
  service_name        = "my-service"
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
