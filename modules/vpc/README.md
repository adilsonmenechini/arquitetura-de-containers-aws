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
 make clean - remover variáveis de ambiente
 ```
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region | `string` | `"us-east-1"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags | `map(string)` | <pre>{<br>  "created_by": "terraform-linuxtips-aws-container-architecture",<br>  "day": "day1",<br>  "sandbox": "linuxtips"<br>}</pre> | no |
| <a name="input_databases_subnet_cidr"></a> [databases\_subnet\_cidr](#input\_databases\_subnet\_cidr) | The databases subnet CIDR | `list(string)` | <pre>[<br>  "10.0.51.0/24",<br>  "10.0.52.0/24",<br>  "10.0.53.0/24"<br>]</pre> | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | The private subnet CIDR | `list(string)` | <pre>[<br>  "10.0.0.0/20",<br>  "10.0.16.0/20",<br>  "10.0.32.0/20"<br>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The resource name sufix | `string` | `"linuxtips"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | The public subnet CIDR | `list(string)` | <pre>[<br>  "10.0.48.0/24",<br>  "10.0.49.0/24",<br>  "10.0.50.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR | `string` | `"10.0.0.0/16"` | no |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_parameter_database_subnets"></a> [ssm\_parameter\_database\_subnets](#output\_ssm\_parameter\_database\_subnets) | AWS SSM parameter store database subnets id |
| <a name="output_ssm_parameter_private_subnets"></a> [ssm\_parameter\_private\_subnets](#output\_ssm\_parameter\_private\_subnets) | AWS SSM parameter store private subnets id |
| <a name="output_ssm_parameter_public_subnets"></a> [ssm\_parameter\_public\_subnets](#output\_ssm\_parameter\_public\_subnets) | AWS SSM parameter store public subnets id |
| <a name="output_ssm_parameter_vpc"></a> [ssm\_parameter\_vpc](#output\_ssm\_parameter\_vpc) | AWS SSM parameter store VPC id |
<!-- END_TF_DOCS --> 
