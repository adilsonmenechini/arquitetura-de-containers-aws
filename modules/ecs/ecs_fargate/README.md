<!-- BEGIN_TF_DOCS -->
# ECS Fargate

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
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ingress_cidr_enabled"></a> [alb\_ingress\_cidr\_enabled](#input\_alb\_ingress\_cidr\_enabled) | List of CIDR blocks allowed to access the Application Load Balancer (ALB). | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be deployed. | `string` | `"us-east-1"` | no |
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of capacity providers used by ECS, including Fargate options. | `list(string)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for resources, useful for identification and management. | `map(string)` | <pre>{<br>  "created_by": "arquitetura_de_containers_aws",<br>  "day": "day5",<br>  "sandbox": "linuxtips"<br>}</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to identify the project. | `string` | `"linuxtips"` | no |
| <a name="input_ssm_private_subnet_list"></a> [ssm\_private\_subnet\_list](#input\_ssm\_private\_subnet\_list) | List of private subnet IDs stored in the AWS Systems Manager Parameter Store. | `list(string)` | <pre>[<br>  "/linuxtips/vpc/subnet_private_us_east_1a_id",<br>  "/linuxtips/vpc/subnet_private_us_east_1b_id",<br>  "/linuxtips/vpc/subnet_private_us_east_1c_id"<br>]</pre> | no |
| <a name="input_ssm_public_subnet_list"></a> [ssm\_public\_subnet\_list](#input\_ssm\_public\_subnet\_list) | List of public subnet IDs stored in the AWS Systems Manager Parameter Store. | `list(string)` | <pre>[<br>  "/linuxtips/vpc/subnet_public_us_east_1a_id",<br>  "/linuxtips/vpc/subnet_public_us_east_1b_id",<br>  "/linuxtips/vpc/subnet_public_us_east_1c_id"<br>]</pre> | no |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | The VPC ID stored in the AWS Systems Manager Parameter Store. | `string` | `"/linuxtips/vpc/vpc_id"` | no |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_alb_dns_name"></a> [ecs\_alb\_dns\_name](#output\_ecs\_alb\_dns\_name) | The ECS ALB dns name |
| <a name="output_ssm_alb_arn"></a> [ssm\_alb\_arn](#output\_ssm\_alb\_arn) | AWS SSM parameter store ALB arn |
| <a name="output_ssm_alb_listener_arn"></a> [ssm\_alb\_listener\_arn](#output\_ssm\_alb\_listener\_arn) | AWS SSM parameter store ALB listner arn |
<!-- END_TF_DOCS --> 
