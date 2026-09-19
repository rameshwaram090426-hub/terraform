# Creates the VPC, subnet resources, and internet routing for the reusable networking module.
# Pull the list of currently available AWS AZs to validate subnet placement.
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  public_subnets = {
    for key, config in var.subnet_config : key => config if config.public
  }
  private_subnets = {
    for key, config in var.subnet_config : key => config if !config.public
  }
}

# Create the main VPC that will contain the module-managed subnet resources.
resource "aws_vpc" "this" {

  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
}

# Create each subnet with its configured CIDR block, AZ, and naming metadata.
resource "aws_subnet" "this" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block
  tags = {
    Name = each.value.name
  }
  lifecycle {
    precondition {
      condition     = contains(data.aws_availability_zones.available.names, each.value.az)
      error_message = "Invalid Avilabilty Zone"
    }
  }
}

# Attach an Internet Gateway when at least one public subnet is defined.
resource "aws_internet_gateway" "this" {
  count = length(local.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.vpc_config.name}-IGW"
  }
}

# Create a public route table with a default internet route for public subnets.
resource "aws_route_table" "public_rt" {
  count  = length(local.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }
}

# Associate each public subnet with the public route table so traffic can leave the VPC.
resource "aws_route_table_association" "public" {
  for_each       = local.public_subnets
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.public_rt[0].id
}