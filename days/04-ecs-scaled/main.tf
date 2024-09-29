module "ecs_app" {
  ##source = "git::https://https://github.com/adilsonmenechini/arquitetura-de-containers-aws.git//modules/ecs/ecs_app"
  source = "../../modules/ecs/ecs_app"

  common_tags             = var.common_tags
  aws_region              = var.aws_region
  project_name            = var.project_name
  ssm_vpc_id              = var.ssm_vpc_id
  ssm_private_subnet_list = var.ssm_private_subnet_list
  ssm_alb_listener_arn    = var.ssm_alb_listener_arn
  ecs_service             = var.ecs_service
  common_scale            = var.common_scale
  cloudwatch_scale        = var.cloudwatch_scale
  tracking_scale_cpu      = var.tracking_scale_cpu
  tracking_scale_requests = var.tracking_scale_requests
  ssm_alb_arn             = var.ssm_alb_arn
}

# Pull chip image from Docker Hub and push to the ECR
resource "docker_image" "chip" {
  name = "fidelissauro/chip:latest"
}

resource "docker_tag" "ecr_chip" {
  source_image = docker_image.chip.name
  target_image = "${module.ecs_app.ecr_repo_url}:latest"
}

resource "docker_registry_image" "ecr_chip" {
  name = docker_tag.ecr_chip.target_image
}