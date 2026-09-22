// Pin and configure the AWS provider.
terraform {
  required_version = "1.16.3"
  cloud {
    organization = "abhinav14mishra"
    workspaces {
      name = "terraform-cli"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
