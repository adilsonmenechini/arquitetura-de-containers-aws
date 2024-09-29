<!-- BEGIN_TF_DOCS -->
# ECS EC2

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
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.5 |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ingress_cidr_enabled"></a> [alb\_ingress\_cidr\_enabled](#input\_alb\_ingress\_cidr\_enabled) | List of CIDR blocks allowed to access the Application Load Balancer (ALB). | `list(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be deployed. | `string` | `"us-east-1"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags applied to resources for better organization and management. | `map(string)` | n/a | yes |
| <a name="input_day_name"></a> [day\_name](#input\_day\_name) | Identifier for the project or task, typically representing the project day. | `string` | `"day1"` | no |
| <a name="input_ecs"></a> [ecs](#input\_ecs) | Configuration for ECS node sizing, including AMI, instance types, and scaling settings. | <pre>object({<br>    nodes_ami           = string<br>    node_instance_type  = string<br>    node_volume_size_gb = number<br>    node_volume_type    = optional(string, "gp3")<br>    on_demand = object({<br>      desired_size = number<br>      min_size     = number<br>      max_size     = number<br>    })<br>    spot = object({<br>      desired_size = number<br>      min_size     = number<br>      max_size     = number<br>      max_price    = string<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., dev, staging, prod). | `string` | `"dev"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to identify the project. | `string` | n/a | yes |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_alb"></a> [ecs\_alb](#output\_ecs\_alb) | The ECS ALB dns name |
<!-- END_TF_DOCS --> 
