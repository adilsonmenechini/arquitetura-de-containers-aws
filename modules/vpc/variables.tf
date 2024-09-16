variable "common_tags" {
  type        = map(string)
  description = "Common tags"
  default = {
    created_by = "aws-container-architecture"
  }
}

variable "project_name" {
  type        = string
  description = "The resource name sufix"
  default     = "linuxtips"
}

variable "aws_region" {
  type        = string
  description = "The AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC CIDR"
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "The VPC must be a valid IPv4 CIDR."
  }
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "The private subnet CIDR"
  validation {
    condition = length(var.private_subnet_cidr) > 0 && alltrue([
      for cidr in var.private_subnet_cidr : can(cidrhost(cidr, 0))
    ])
    error_message = "Needs at least one private subnet and it must be a valid IPv4 CIDR."
  }
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "The public subnet CIDR"
  validation {
    condition = length(var.public_subnet_cidr) > 0 && alltrue([
      for cidr in var.public_subnet_cidr : can(cidrhost(cidr, 0))
    ])
    error_message = "Needs at least one public subnet and it must be a valid IPv4 CIDR."
  }
}

variable "databases_subnet_cidr" {
  type        = list(string)
  description = "The databases subnet CIDR"
  validation {
    condition = length(var.databases_subnet_cidr) > 0 && alltrue([
      for cidr in var.databases_subnet_cidr : can(cidrhost(cidr, 0))
    ])
    error_message = "Needs at least one database subnet and must be a valid IPv4 CIDR."
  }
}
