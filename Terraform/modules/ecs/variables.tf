variable "cluster_name" {
  type = string
}

variable "family" {
  type = string
}

variable "container_definitions" {
  type = string
}

variable "memory" {
  type = number
}

variable "cpu" {
  type = number
}

variable "execution_role_arn" {
  type = string
}

variable "service_name" {
  type = string
}

variable "desired_count" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}






variable "cluster_name" {
  type = string
}

variable "microservice1_image" {
  type = string
}

variable "microservice2_image" {
  type = string
}

