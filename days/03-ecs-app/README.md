<!-- BEGIN_TF_DOCS -->
# Curso de Arquitetura de Containers na AWS - VPC

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
| <a name="provider_http"></a> [http](#provider\_http) | ~> 3.4.1 |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be deployed. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags applied to resources for identification and management. | `map(string)` | n/a | yes |
| <a name="input_day_name"></a> [day\_name](#input\_day\_name) | Identifier for the project or task, often representing the project day. | `string` | `"day1"` | no |
| <a name="input_ecs_service"></a> [ecs\_service](#input\_ecs\_service) | Configuration details for the ECS service, including resource allocation and settings. | <pre>object({<br>    name                 = string<br>    port                 = number<br>    cpu                  = number<br>    memory_mb            = number<br>    ecs_name             = string<br>    environment_variables = list(object({<br>      name  = string<br>      value = string<br>    }))<br>    capabilities         = list(string)<br>    service_healthcheck  = map(any)<br>    service_launch_type  = string<br>    service_task_count   = number<br>    service_hosts        = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., dev, staging, prod). | `string` | `"dev"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to identify the project. | `string` | n/a | yes |
| <a name="input_ssm_alb_listener_arn"></a> [ssm\_alb\_listener\_arn](#input\_ssm\_alb\_listener\_arn) | ARN of the ALB listener retrieved from AWS Systems Manager Parameter Store. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_list"></a> [ssm\_private\_subnet\_list](#input\_ssm\_private\_subnet\_list) | List of private subnet IDs stored in the AWS Systems Manager Parameter Store. | `list(string)` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | The VPC ID stored in the AWS Systems Manager Parameter Store. | `string` | n/a | yes |
#### Outputs

No outputs.
<!-- END_TF_DOCS --> 
