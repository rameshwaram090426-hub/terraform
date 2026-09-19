```markdown
<!-- This module provisions a VPC, public/private subnets, and routing resources from a reusable configuration map. -->
# Terraform AWS VPC & Subnet Module

A modular and flexible Terraform module for provisioning an AWS VPC, automated public and private subnets using a map configuration, an Internet Gateway, and corresponding Route Tables.

---

## Example Usage

```hcl
module "vpc" {
  source = "./modules/networking"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "local_vpc_module"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      name       = "subnet_1"
      az         = "ap-south-1a"
      public     = true
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      name       = "subnet_2"
      az         = "ap-south-1b"
      public     = false
    }
    subnet_3 = {
      cidr_block = "10.0.2.0/24"
      name       = "subnet_3"
      az         = "ap-south-1c"
      public     = false
    }
  }
}

```

---

## Requirements

| Name | Version |
| --- | --- |
| terraform | >= 1.3.0 |
| aws | >= 4.0.0 |

---

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| vpc_config | Configuration block for the VPC (CIDR block and name). | `object({ cidr_block = string, name = string })` | n/a | yes |
| subnet_config | Map of subnets to create with CIDR block, name, availability zone, and public flag. | `map(object({ cidr_block = string, name = string, az = string, public = bool }))` | n/a | yes |

---

## Outputs

| Name | Description |
| --- | --- |
| vpc_id | The ID of the created VPC. |
| module_public_subnets | Details of the public subnets created. |
| module_private_subnets | Details of the private subnets created. |
