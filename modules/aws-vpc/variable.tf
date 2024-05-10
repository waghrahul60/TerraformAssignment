########### VPC variables #############
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "The tenancy option for instances launched into the VPC (default, dedicated)"
}

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the VPC"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "environment" {
  type        = string
  description = "The environment name (e.g., dev, prod)"
}

variable "region" {
  type        = string
  description = "The AWS region where the VPC will be created"
}


########### Subnets  Variables #############

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "app_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for subnets"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "A boolean flag to enable/disable automatic assignment of public IP addresses"
}

################ Route Table #################

variable "public_routes" {
  type = map(object({
    cidr_block = string
    gateway_id = string
  }))
  description = "Map of routes with CIDR block and gateway ID"
}

variable "private_routes" {
  type = map(object({
    cidr_block = string
    gateway_id = string
  }))
  description = "Map of routes with CIDR block and gateway ID"
}

variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}