# terraform-aws-netsells-security

```
module "netsells_security" {
  source = "github.com/netsells/terraform-aws-netsells-security?ref=v0.0.1"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ecs_connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.manage_env](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.manage_hosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ssm_connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.NetsellsSecurityEngineer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.NetsellsSecurityOps](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.NetsellsSecurityReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityEngineer-ECSConnect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityEngineer-ManageEnv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityEngineer-ManageHosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityEngineer-ReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityEngineer-SSMConnect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityOps-Admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.NetsellsSecurityReadOnly-ReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_saml_provider.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_saml_provider) | resource |
| [aws_iam_policy_document.ecs_connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.manage_env](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.manage_hosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.saml_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_role_engineer_edit_ecs_env"></a> [role\_engineer\_edit\_ecs\_env](#input\_role\_engineer\_edit\_ecs\_env) | n/a | `bool` | `false` | no |
| <a name="input_role_engineer_manage_hosting"></a> [role\_engineer\_manage\_hosting](#input\_role\_engineer\_manage\_hosting) | Allows engineers to kill ECS tasks | `bool` | `true` | no |
| <a name="input_role_engineer_ssm_ec2"></a> [role\_engineer\_ssm\_ec2](#input\_role\_engineer\_ssm\_ec2) | n/a | `bool` | `false` | no |
| <a name="input_role_engineer_ssm_ecs"></a> [role\_engineer\_ssm\_ecs](#input\_role\_engineer\_ssm\_ecs) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_engineer_arn"></a> [role\_engineer\_arn](#output\_role\_engineer\_arn) | n/a |
| <a name="output_role_engineer_name"></a> [role\_engineer\_name](#output\_role\_engineer\_name) | n/a |
| <a name="output_role_ops_arn"></a> [role\_ops\_arn](#output\_role\_ops\_arn) | n/a |
| <a name="output_role_ops_name"></a> [role\_ops\_name](#output\_role\_ops\_name) | n/a |
| <a name="output_role_readonly_arn"></a> [role\_readonly\_arn](#output\_role\_readonly\_arn) | n/a |
| <a name="output_role_readonly_name"></a> [role\_readonly\_name](#output\_role\_readonly\_name) | n/a |
