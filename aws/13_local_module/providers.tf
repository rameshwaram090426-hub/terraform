# Declares the Terraform AWS provider and region for this local module example.
# Configure the Terraform version requirements for the AWS provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
# Connect Terraform to the AWS region used for this example deployment.
provider "aws" {
  region = "ap-south-1"
}
