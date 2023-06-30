# Yugabyte Linode for VM


This Terraform code only provision emtpy VM to use with YBA On-prem cloud provider


# Authentication

Check Linode provider [configuration](https://registry.terraform.io/providers/linode/linode/latest/docs#configuration-reference)


# Run Terraform 

```bash
terraform plan -var-file=local.tfvars -out linode.tfplan 
terraform apply "linode.tfplan"
```

# Destroy

```
terraform destroy 
```


# Configure YBA



# Terraform docs

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | 2.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [linode_instance.node_gwenn](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance) | resource |
| [linode_volume.data](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_node_on_prem_public_key_path"></a> [node\_on\_prem\_public\_key\_path](#input\_node\_on\_prem\_public\_key\_path) | Local path to you public key to connect to YB Node instance (Default: empty) | `string` | `null` | no |
| <a name="input_node_on_prem_test"></a> [node\_on\_prem\_test](#input\_node\_on\_prem\_test) | Will create X nodes to test on\_prem | `number` | `0` | no |
| <a name="input_region"></a> [region](#input\_region) | Linode Region | `string` | `"ap-northeast"` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix to be used for every created resources, Please use 3-4 char. (Required) | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Volume size for onn prem node (default: 100) | `string` | `"100"` | no |

## Outputs

No outputs.