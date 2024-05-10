locals {

  default_tags = {
    organisation = "MyOrg"
    Terraform = "Yes"
  }
  default_vpc_tags = {
    Name      = "vpc-${var.project_name}-${var.environment}-${var.region}"
    Terraform = "Yes"
  }

  domain = "vpc"
} 