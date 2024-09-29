variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be deployed."
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for resources to aid in organization and management."
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
  description = "The ALB listener ARN stored in the AWS Systems Manager Parameter Store."
}

variable "ecs_service" {
  type = object({
    name                  = string
    port                  = number
    cpu                   = number
    memory_mb             = number
    ecs_name              = string
    environment_variables  = list(object({
      name  = string
      value = string
    }))
    capabilities          = list(string)
    service_healthcheck   = map(any)
    service_launch_type   = string
    service_hosts         = list(string)
  })
  description = "Configuration for the ECS service."
}

variable "common_scale" {
  type = object({
    scale_type   = string
    task_maximum = number
    task_minimum = number
    task_desired = number
    in_cooldown  = number
    out_cooldown = number
  })
  description = "Parameters for scaling the ECS service."
}

variable "cloudwatch_scale" {
  type = object({
    out_statistic           = string
    out_cpu_threshold       = number
    out_adjustment          = number
    out_comparison_operator = string
    out_period              = number
    out_evaluation_periods  = number
    in_statistic            = string
    in_cpu_threshold        = number
    in_adjustment           = number
    in_comparison_operator  = string
    in_period               = number
    in_evaluation_periods   = number
  })
  description = "Parameters for CloudWatch scaling metrics."
}

variable "tracking_scale_cpu" {
  type        = number
  description = "CPU percentage used for tracking scale metrics."
}

variable "tracking_scale_requests" {
  type        = number
  description = "Number of requests used for tracking scale metrics."
}

variable "ssm_alb_arn" {
  type        = string
  description = "The ALB ARN stored in the AWS Systems Manager Parameter Store."
}
