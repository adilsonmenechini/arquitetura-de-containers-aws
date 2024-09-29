variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be deployed."
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, staging, prod)."
  default     = "dev"
}

variable "day_name" {
  type        = string
  description = "Identifier for the project or task, often representing the project day."
  default     = "day1"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to resources for identification and management."
}

variable "project_name" {
  type        = string
  description = "Suffix used in resource names to identify the project."
}

variable "ssm_vpc_id" {
  type        = string
  description = "The VPC ID stored in the AWS Systems Manager Parameter Store."
}

variable "ssm_private_subnet_list" {
  type        = list(string)
  description = "List of private subnet IDs stored in the AWS Systems Manager Parameter Store."
}

variable "ssm_alb_listener_arn" {
  type        = string
  description = "ARN of the ALB listener retrieved from AWS Systems Manager Parameter Store."
}

variable "ecs_service" {
  type = object({
    name                 = string
    port                 = number
    cpu                  = number
    memory_mb            = number
    ecs_name             = string
    environment_variables = list(object({
      name  = string
      value = string
    }))
    capabilities         = list(string)
    service_healthcheck  = map(any)
    service_launch_type  = string
    service_task_count   = number
    service_hosts        = list(string)
  })
  description = "Configuration details for the ECS service, including resource allocation and settings."
}
