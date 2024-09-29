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
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ingress_cidr_enabled"></a> [alb\_ingress\_cidr\_enabled](#input\_alb\_ingress\_cidr\_enabled) | List of CIDR blocks allowed to access the Application Load Balancer (ALB). | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the resources will be deployed. | `string` | `"us-east-1"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for resources to aid in organization and identification. | `map(string)` | <pre>{<br>  "created_by": "arquitetura_de_containers_aws",<br>  "day": "day2",<br>  "sandbox": "linuxtips"<br>}</pre> | no |
| <a name="input_ecs"></a> [ecs](#input\_ecs) | Configuration for ECS node sizing, including AMI, instance types, and scaling settings. | <pre>object({<br>    nodes_ami           = string<br>    node_instance_type  = string<br>    node_volume_size_gb = number<br>    node_volume_type    = optional(string, "gp3")<br>    on_demand = object({<br>      desired_size = number<br>      min_size     = number<br>      max_size     = number<br>    })<br>    spot = object({<br>      desired_size = number<br>      min_size     = number<br>      max_size     = number<br>      max_price    = string<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Suffix used in resource names to identify the project. | `string` | `"linuxtips"` | no |
| <a name="input_ssm_private_subnet_list"></a> [ssm\_private\_subnet\_list](#input\_ssm\_private\_subnet\_list) | List of private subnet IDs stored in AWS Systems Manager Parameter Store. | `list(string)` | <pre>[<br>  "/linuxtips/vpc/subnet_private_us_east_1a_id",<br>  "/linuxtips/vpc/subnet_private_us_east_1b_id",<br>  "/linuxtips/vpc/subnet_private_us_east_1c_id"<br>]</pre> | no |
| <a name="input_ssm_public_subnet_list"></a> [ssm\_public\_subnet\_list](#input\_ssm\_public\_subnet\_list) | List of public subnet IDs stored in AWS Systems Manager Parameter Store. | `list(string)` | <pre>[<br>  "/linuxtips/vpc/subnet_public_us_east_1a_id",<br>  "/linuxtips/vpc/subnet_public_us_east_1b_id",<br>  "/linuxtips/vpc/subnet_public_us_east_1c_id"<br>]</pre> | no |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | Path to the VPC ID stored in AWS Systems Manager Parameter Store. | `string` | `"/linuxtips/vpc/vpc_id"` | no |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_alb_dns_name"></a> [ecs\_alb\_dns\_name](#output\_ecs\_alb\_dns\_name) | The ECS ALB dns name |
| <a name="output_ssm_alb_arn"></a> [ssm\_alb\_arn](#output\_ssm\_alb\_arn) | AWS SSM parameter store ALB arn |
| <a name="output_ssm_alb_listener_arn"></a> [ssm\_alb\_listener\_arn](#output\_ssm\_alb\_listener\_arn) | AWS SSM parameter store ALB listner arn |
<!-- END_TF_DOCS --> 
