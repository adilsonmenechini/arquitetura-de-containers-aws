module "ecs_app" {
  ##source = "git::https://https://github.com/adilsonmenechini/arquitetura-de-containers-aws.git//modules/ecs/ecs-app"
  source = "../../modules/ecs/ecs-app"

  common_tags             = var.common_tags
  aws_region              = var.aws_region
  project_name            = var.project_name
  ssm_vpc_id              = var.ssm_vpc_id
  ssm_private_subnet_list = var.ssm_private_subnet_list
  ssm_alb_listener_arn    = var.ssm_alb_listener_arn
  ecs_service             = var.ecs_service
}