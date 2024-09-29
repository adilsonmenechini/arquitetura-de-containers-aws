<!-- BEGIN_TF_DOCS -->
# ECS Service

## Comandos

```bash
 ------------------------------------
 Terraform
 ------------------------------------

 make init - Terraform init
 make plan - Terraform plan
 make apply - Terraform apply
 make destroy - Terraform destroy
 make tfdocs - Gerar documentação do Terraform
 make tflint -  tflint
 make clean - remover variáveis de ambiente
 ```
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | ARN of the Application Load Balancer (ALB) utilized by the ECS service. | `string` | n/a | yes |
| <a name="input_alb_listener_arn"></a> [alb\_listener\_arn](#input\_alb\_listener\_arn) | Amazon Resource Name (ARN) of the Application Load Balancer (ALB) listener associated with the ECS service. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the resources will be deployed. | `string` | n/a | yes |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | List of capabilities specifying the launch type (e.g., EC2 or FARGATE) for the ECS service. | `list(string)` | `[]` | no |
| <a name="input_cloudwatch_scale"></a> [cloudwatch\_scale](#input\_cloudwatch\_scale) | Parameters for CloudWatch scaling:<br>    - (in\|out)\_statistic: Statistic to apply to the metric for scaling.<br>    - (in\|out)\_cpu\_threshold: Threshold value for triggering scaling actions.<br>    - (in\|out)\_adjustment: Number of tasks to adjust when the threshold is breached.<br>    - (in\|out)\_comparison\_operator: Operator used for comparing the statistic and threshold.<br>    - (in\|out)\_period: Time window (in seconds) for the metric.<br>    - (in\|out)\_evaluation\_periods: Number of periods to evaluate against the threshold. | <pre>object({<br>    out_statistic           = string<br>    out_cpu_threshold       = number<br>    out_adjustment          = number<br>    out_comparison_operator = string<br>    out_period              = number<br>    out_evaluation_periods  = number<br>    in_statistic            = string<br>    in_cpu_threshold        = number<br>    in_adjustment           = number<br>    in_comparison_operator  = string<br>    in_period               = number<br>    in_evaluation_periods   = number<br>  })</pre> | n/a | yes |
| <a name="input_common_scale"></a> [common\_scale](#input\_common\_scale) | Parameters for scaling the ECS service:<br>    - scale\_type: Type of autoscaling strategy (cpu, cpu\_tracking, or requests\_tracking).<br>    - task\_maximum: Maximum allowable tasks.<br>    - task\_minimum: Minimum required tasks.<br>    - task\_desired: Desired number of tasks.<br>    - in\_cooldown: Time (in seconds) to wait after scaling in before another scaling action can occur.<br>    - out\_cooldown: Time (in seconds) to wait after scaling out before another scaling action can occur. | <pre>object({<br>    scale_type   = string<br>    task_maximum = number<br>    task_minimum = number<br>    task_desired = number<br>    in_cooldown  = number<br>    out_cooldown = number<br>  })</pre> | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Key-value pairs for common resource tags to facilitate identification and management. | `map(string)` | n/a | yes |
| <a name="input_ecs_name"></a> [ecs\_name](#input\_ecs\_name) | Name of the ECS cluster that the service will run within. | `string` | n/a | yes |
| <a name="input_ecs_service_cpu"></a> [ecs\_service\_cpu](#input\_ecs\_service\_cpu) | Maximum CPU units allocated to the ECS service task. Can be specified in CPU units or vCPUs. | `number` | n/a | yes |
| <a name="input_ecs_service_memory_mb"></a> [ecs\_service\_memory\_mb](#input\_ecs\_service\_memory\_mb) | Maximum memory limit (in MiB) allocated to the ECS service task. | `number` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | Name of the ECS service, used for identification and reference. | `string` | n/a | yes |
| <a name="input_ecs_service_port"></a> [ecs\_service\_port](#input\_ecs\_service\_port) | Port on which the ECS service will listen for incoming traffic. | `number` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | List of environment variables that will be passed to the ECS service tasks. | <pre>list(object({<br>    name  : string<br>    value : string<br>  }))</pre> | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs to be used for the ECS service. | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to denote the associated project. | `string` | n/a | yes |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Health check parameters for the ECS service, defining how the service health is monitored. | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | List of DNS names associated with the ECS service. | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Specifies the launch type for the service, such as EC2 or Fargate. | `string` | n/a | yes |
| <a name="input_service_listener_arn"></a> [service\_listener\_arn](#input\_service\_listener\_arn) | ARN of the ALB listener that routes traffic to the ECS service. | `string` | n/a | yes |
| <a name="input_service_task_execution_role_arn"></a> [service\_task\_execution\_role\_arn](#input\_service\_task\_execution\_role\_arn) | ARN of the IAM role that grants the ECS service permission to access AWS resources. | `string` | n/a | yes |
| <a name="input_tracking_scale_cpu"></a> [tracking\_scale\_cpu](#input\_tracking\_scale\_cpu) | Percentage of CPU usage used for tracking and scaling decisions. | `number` | n/a | yes |
| <a name="input_tracking_scale_requests"></a> [tracking\_scale\_requests](#input\_tracking\_scale\_requests) | Number of requests used as a metric for tracking and scaling decisions. | `number` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier for the VPC where the ECS service will be deployed. | `string` | n/a | yes |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repo_url"></a> [ecr\_repo\_url](#output\_ecr\_repo\_url) | The URL of the ECR repository |
<!-- END_TF_DOCS --> 
