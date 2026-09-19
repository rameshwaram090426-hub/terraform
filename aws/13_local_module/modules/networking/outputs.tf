# Exposes the VPC and subnet IDs along with availability-zone details to callers.
locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}

#VPC_ID
output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The AWS Id from created VPC"
}

#Public_Subnets_ID & Availabilty Zone

output "public_subnets" {
  value       = local.output_public_subnets
  description = "The Id & availability zone for public subnets"
}


#Private_Subnets_ID

output "private_subnets" {
  value       = local.output_private_subnets
  description = "The Id & availability zone for private subnets"
}
