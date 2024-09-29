variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
  description = "value of the environment"
  default = "dev"
}

variable "day_name" {
  type = string
  description = "Project name"
  default = "day1"
}