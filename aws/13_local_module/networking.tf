# Local module entry that wires the AWS networking module with a sample VPC and subnet layout.
# Instantiate the reusable VPC module with a custom CIDR and subnet configuration.
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
    }
    subnet_3 = {
      cidr_block = "10.0.2.0/24"
      name       = "subnet_3"
      az         = "ap-south-1c"
    }
  }

}