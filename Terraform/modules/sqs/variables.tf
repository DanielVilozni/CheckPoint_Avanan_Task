variable "queue_name" {
  type = string
}

variable "visibility_timeout" {
  type    = number
  default = 30
}

variable "message_retention_seconds" {
  type    = number
  default = 86400  # 1 day
}

variable "delay_seconds" {
  type    = number
  default = 0
}

variable "receive_wait_time_seconds" {
  type    = number
  default = 0
}
