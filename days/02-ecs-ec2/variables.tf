variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be deployed."
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, staging, prod)."
  default     = "dev"
}

variable "day_name" {
  type        = string
  description = "Identifier for the project or task, typically representing the project day."
  default     = "day1"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to resources for better organization and management."
}

variable "project_name" {
  type        = string
  description = "Suffix used in resource names to identify the project."
}

variable "alb_ingress_cidr_enabled" {
  type        = list(string)
  description = "List of CIDR blocks allowed to access the Application Load Balancer (ALB)."
}

variable "ecs" {
  type = object({
    nodes_ami           = string
    node_instance_type  = string
    node_volume_size_gb = number
    node_volume_type    = optional(string, "gp3")
    on_demand = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
    spot = object({
      desired_size = number
      min_size     = number
      max_size     = number
      max_price    = string
    })
  })
  description = "Configuration for ECS node sizing, including AMI, instance types, and scaling settings."
}
