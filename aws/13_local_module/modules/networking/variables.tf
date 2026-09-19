# Defines the inputs for the custom VPC and subnet configuration managed by this module.
# Configure the VPC CIDR range and display name for the network.
variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The cidr_block config must contain a valid CIDR block"
  }
}

# Configure each subnet with a CIDR, AZ, name, and whether it should be public.
variable "subnet_config" {
  type = map(object({
    cidr_block = string
    name       = string
    az         = string
    public     = optional(bool, false)
  }))
  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config must contain a valid CIDR block"
  }
}

