locals {
  default_tags = {
    Name      = "vpc-${var.project_name}-${var.environment}-${var.region}"
    Terraform = "Yes"
  }
}