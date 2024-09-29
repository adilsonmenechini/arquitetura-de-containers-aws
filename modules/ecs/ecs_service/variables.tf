variable "common_tags" {
  type        = map(string)
  description = "Key-value pairs for common resource tags to facilitate identification and management."
}

variable "project_name" {
  type        = string
  description = "Suffix used in resource names to denote the associated project."
}

variable "aws_region" {
  type        = string
  description = "AWS region where the resources will be deployed."
}

variable "ecs_service_name" {
  type        = string
  description = "Name of the ECS service, used for identification and reference."
}

variable "ecs_service_port" {
  type        = number
  description = "Port on which the ECS service will listen for incoming traffic."
}

variable "ecs_service_cpu" {
  type        = number
  description = "Maximum CPU units allocated to the ECS service task. Can be specified in CPU units or vCPUs."
}

variable "ecs_service_memory_mb" {
  type        = number
  description = "Maximum memory limit (in MiB) allocated to the ECS service task."
}

variable "ecs_name" {
  type        = string
  description = "Name of the ECS cluster that the service will run within."
}

variable "vpc_id" {
  type        = string
  description = "Identifier for the VPC where the ECS service will be deployed."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs to be used for the ECS service."
}

variable "alb_listener_arn" {
  type        = string
  description = "Amazon Resource Name (ARN) of the Application Load Balancer (ALB) listener associated with the ECS service."
}

variable "service_task_execution_role_arn" {
  type        = string
  description = "ARN of the IAM role that grants the ECS service permission to access AWS resources."
}

variable "environment_variables" {
  type = list(object({
    name  : string
    value : string
  }))
  description = "List of environment variables that will be passed to the ECS service tasks."
  default     = []
}

variable "capabilities" {
  type        = list(string)
  description = "List of capabilities specifying the launch type (e.g., EC2 or FARGATE) for the ECS service."
  default     = []
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Health check parameters for the ECS service, defining how the service health is monitored."
}

variable "service_launch_type" {
  type        = string
  description = "Specifies the launch type for the service, such as EC2 or Fargate."
}

variable "service_hosts" {
  type        = list(string)
  description = "List of DNS names associated with the ECS service."
}

variable "service_listener_arn" {
  type        = string
  description = "ARN of the ALB listener that routes traffic to the ECS service."
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
  description = <<EOT
    Parameters for scaling the ECS service:
    - scale_type: Type of autoscaling strategy (cpu, cpu_tracking, or requests_tracking).
    - task_maximum: Maximum allowable tasks.
    - task_minimum: Minimum required tasks.
    - task_desired: Desired number of tasks.
    - in_cooldown: Time (in seconds) to wait after scaling in before another scaling action can occur.
    - out_cooldown: Time (in seconds) to wait after scaling out before another scaling action can occur.
  EOT
  validation {
    condition     = var.common_scale.scale_type == "cpu" || var.common_scale.scale_type == "cpu_tracking" || var.common_scale.scale_type == "requests_tracking"
    error_message = "Scale type must be one of: cpu, cpu_tracking, or requests_tracking."
  }
  validation {
    condition     = var.common_scale.task_maximum >= var.common_scale.task_minimum
    error_message = "Maximum task count must be greater than or equal to minimum task count."
  }
  validation {
    condition     = var.common_scale.task_desired >= var.common_scale.task_minimum && var.common_scale.task_desired <= var.common_scale.task_maximum
    error_message = "Desired task count must be within the range defined by minimum and maximum tasks."
  }
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
  description = <<EOT
    Parameters for CloudWatch scaling:
    - (in|out)_statistic: Statistic to apply to the metric for scaling.
    - (in|out)_cpu_threshold: Threshold value for triggering scaling actions.
    - (in|out)_adjustment: Number of tasks to adjust when the threshold is breached.
    - (in|out)_comparison_operator: Operator used for comparing the statistic and threshold.
    - (in|out)_period: Time window (in seconds) for the metric.
    - (in|out)_evaluation_periods: Number of periods to evaluate against the threshold.
  EOT
}

variable "tracking_scale_cpu" {
  type        = number
  description = "Percentage of CPU usage used for tracking and scaling decisions."
}

variable "tracking_scale_requests" {
  type        = number
  description = "Number of requests used as a metric for tracking and scaling decisions."
}

variable "alb_arn" {
  type        = string
  description = "ARN of the Application Load Balancer (ALB) utilized by the ECS service."
}
