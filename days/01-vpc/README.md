<!-- BEGIN_TF_DOCS -->
# Curso de Arquitetura de Containers na AWS - VPC

## Comandos

```bash
 ------------------------------------
 Terraform
 ------------------------------------

 make init - Terraform init
 make tfsec -  tfsec
 make plan - Terraform plan
 make apply - Terraform apply
 make destroy - Terraform destroy
 make tfdocs - Gerar documentação do Terraform
 make tflint -  tflint
 make clean - remover variáveis de ambiente
 ```
#### Providers

No providers.
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be deployed. | `string` | `"us-east-1"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags applied to resources for better organization and management. | `map(string)` | n/a | yes |
| <a name="input_databases_subnet_cidr"></a> [databases\_subnet\_cidr](#input\_databases\_subnet\_cidr) | List of CIDR blocks for subnets designated for databases. | `list(string)` | n/a | yes |
| <a name="input_day_name"></a> [day\_name](#input\_day\_name) | Identifier for the project or task, typically representing the project day. | `string` | `"day1"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., dev, staging, prod). | `string` | `"dev"` | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | List of CIDR blocks for private subnets. | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to identify the project. | `string` | n/a | yes |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | List of CIDR blocks for public subnets. | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the Virtual Private Cloud (VPC). | `string` | n/a | yes |
#### Outputs

No outputs.
<!-- END_TF_DOCS --> 
