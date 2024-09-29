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

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the Virtual Private Cloud (VPC)."
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets."
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets."
}

variable "databases_subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for subnets designated for databases."
}
