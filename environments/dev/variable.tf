variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment for the resources"
  type        = string
  default     = "dev"
}

###################### VPC ######################
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "Tenancy option for instances"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {
    "Name"        = "MyTaskVPC"
    "Environment" = "Dev"
  }
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
}





variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidr_blocks" {
  description = "CIDR blocks for application subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for instances"
  type        = bool
  default     = true
}

variable "create_nat_gateway" {
  description = "Create NAT gateway"
  type        = bool
  default     = true
}

############  EC2 ##############

variable "instance_type" {
  type        = string
  description = "The instance type for EC2 instances"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for EC2 instances"
}

variable "instance_count" {
  type        = number
  description = "The number of EC2 instances to launch"
}


variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with EC2 instances"
}

variable "attach_instance_profile" {
  type        = bool
  description = "Whether to attach an IAM instance profile to the EC2 instances"
}

variable "attach_eip" {
  type        = bool
  description = "Whether to attach Elastic IPs to EC2 instances"
}

variable "storage_size" {
  type        = number
  description = "The size of the root volume for EC2 instances (in GB)"
}

variable "application" {
  type        = string
  description = "The application name"
}

variable "tags" {
  type        = map(string)
  description = "A map of additional tags for EC2 instances"
}


############  Security Group  #############
# CIDR Ingress Variables
variable "create_ingress_cidr" {
  type        = bool
  description = "Whether to create CIDR ingress rules"
}

variable "ingress_cidr_from_port" {
  type        = list(number)
  description = "The starting port for CIDR ingress rules"
}

variable "ingress_cidr_to_port" {
  type        = list(number)
  description = "The ending port for CIDR ingress rules"
}

variable "ingress_cidr_protocol" {
  type        = list(string)
  description = "The protocol for CIDR ingress rules"
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "The CIDR block for CIDR ingress rules"
}

# Security Group Ingress Variables
variable "create_ingress_sg" {
  type        = bool
  description = "Whether to create security group ingress rules"
}

variable "ingress_sg_from_port" {
  type        = list(number)
  description = "The starting port for security group ingress rules"
}

variable "ingress_sg_to_port" {
  type        = list(number)
  description = "The ending port for security group ingress rules"
}

variable "ingress_sg_protocol" {
  type        = list(string)
  description = "The protocol for security group ingress rules"
}

variable "ingress_security_group_ids" {
  type        = list(string)
  description = "The security group IDs for security group ingress rules"
}

# CIDR Egress Variables
variable "create_egress_cidr" {
  type        = bool
  description = "Whether to create CIDR egress rules"
}

variable "egress_cidr_from_port" {
  type        = list(number)
  description = "The starting port for CIDR egress rules"
}

variable "egress_cidr_to_port" {
  type        = list(number)
  description = "The ending port for CIDR egress rules"
}

variable "egress_cidr_protocol" {
  type        = list(string)
  description = "The protocol for CIDR egress rules"
}

variable "egress_cidr_block" {
  type        = list(string)
  description = "The CIDR block for CIDR egress rules"
}

# Security Group Egress Variables
variable "create_egress_sg" {
  type        = bool
  description = "Whether to create security group egress rules"
}

variable "egress_sg_from_port" {
  type        = list(number)
  description = "The starting port for security group egress rules"
}

variable "egress_sg_to_port" {
  type        = list(number)
  description = "The ending port for security group egress rules"
}

variable "egress_sg_protocol" {
  type        = list(string)
  description = "The protocol for security group egress rules"
}

variable "egress_security_group_ids" {
  type        = list(string)
  description = "The security group IDs for security group egress rules"
}

variable "iam_policy_json_file" {
  type        = string
  description = "Name of the json file"
}