module "sqs" {
  source                     = "../../../modules/sqs"
  queue_name                 = "my-app-queue"
  visibility_timeout          = 60  # 1 minute
  message_retention_seconds   = 345600  # 4 days
  delay_seconds               = 10
  receive_wait_time_seconds   = 5
}

