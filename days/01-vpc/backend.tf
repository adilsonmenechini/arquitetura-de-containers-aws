terraform {
  backend "s3" {
    key    = format("aca/%s/%s/terraform.tfstate", var.environment, var.day_name)
    region = var.aws_region
  }
}