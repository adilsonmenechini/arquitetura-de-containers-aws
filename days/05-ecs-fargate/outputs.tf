output "ecs_alb" {
  value       = module.ecs_fargate.ecs_alb_dns_name
  description = "The ECS ALB dns name"
}