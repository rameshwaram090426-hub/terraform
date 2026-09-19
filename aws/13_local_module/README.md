<!-- This example demonstrates a reusable local Terraform module for creating a VPC and subnet topology in AWS. -->
A networking module that should : 
- Create a VPC with a given CIDR block
- Allow user to provide configuration
    - The user should be able to mark the subnet as public or private 
    - The user should be able to provider CIDR block
    - The user should be able to provide AWS AZ