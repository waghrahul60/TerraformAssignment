variable "attach_instance_profile" {
  type        = bool
  description = "Whether to attach an IAM instance profile to the EC2 instances"
}

variable "environment" {
  type        = string
  description = "The environment (e.g., dev, prod)"
}

variable "application" {
  type        = string
  description = "The application name"
}

variable "iam_role" {
  type        = string
  description = "The IAM role to associate with the instance profile"
}

variable "ami_id" {
  type        = string
  description = "The ID of the AMI to use for EC2 instances"
}

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

variable "security_group_ids" {
  type        = list(string)
  description = "The list of security group IDs for EC2 instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The list of subnet IDs for EC2 instances"
}

variable "storage_size" {
  type        = number
  description = "The size of the root volume for EC2 instances (in GB)"
}

variable "tags" {
  type        = map(string)
  description = "A map of additional tags for EC2 instances"
}

variable "attach_eip" {
  type        = bool
  description = "Whether to attach Elastic IPs to EC2 instances"
}
