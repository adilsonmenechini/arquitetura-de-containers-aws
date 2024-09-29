variable "common_tags" {
  type        = map(string)
  description = "Common tags for resources, useful for identification and management."
  default = {
    created_by = "arquitetura_de_containers_aws"
    sandbox    = "linuxtips"
    day        = "day5"
  }
}

variable "project_name" {
  type        = string
  description = "Suffix used in resource names to identify the project."
  default     = "linuxtips"
}

variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be deployed."
  default     = "us-east-1"
}

variable "ssm_vpc_id" {
  type        = string
  description = "The VPC ID stored in the AWS Systems Manager Parameter Store."
  default     = "/linuxtips/vpc/vpc_id"
}

variable "ssm_private_subnet_list" {
  type        = list(string)
  description = "List of private subnet IDs stored in the AWS Systems Manager Parameter Store."
  default = [
    "/linuxtips/vpc/subnet_private_us_east_1a_id",
    "/linuxtips/vpc/subnet_private_us_east_1b_id",
    "/linuxtips/vpc/subnet_private_us_east_1c_id"
  ]
  validation {
    condition     = length(var.ssm_private_subnet_list) > 0
    error_message = "At least one private subnet ID is required."
  }
}

variable "ssm_public_subnet_list" {
  type        = list(string)
  description = "List of public subnet IDs stored in the AWS Systems Manager Parameter Store."
  default = [
    "/linuxtips/vpc/subnet_public_us_east_1a_id",
    "/linuxtips/vpc/subnet_public_us_east_1b_id",
    "/linuxtips/vpc/subnet_public_us_east_1c_id"
  ]
  validation {
    condition     = length(var.ssm_public_subnet_list) > 0
    error_message = "At least one public subnet ID is required."
  }
}

variable "alb_ingress_cidr_enabled" {
  type        = list(string)
  description = "List of CIDR blocks allowed to access the Application Load Balancer (ALB)."
  default     = ["0.0.0.0/0"]
  validation {
    condition     = length(var.alb_ingress_cidr_enabled) > 0
    error_message = "At least one CIDR block is required."
  }
}

variable "capacity_providers" {
  type        = list(string)
  description = "List of capacity providers used by ECS, including Fargate options."
  default     = ["FARGATE", "FARGATE_SPOT"]
}
