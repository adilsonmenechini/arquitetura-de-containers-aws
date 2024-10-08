terraform {

  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.39.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.1"
    }
  }

}

provider "aws" {
  region = var.aws_region
}