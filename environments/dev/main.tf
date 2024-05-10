########### Create VPC with 2 public ad two Private subnet ###########

module "vpc" {
  source = "../../modules/aws-vpc"

  # VPC variables
  vpc_cidr_block          = "10.0.0.0/16"
  instance_tenancy        = "default"
  enable_dns_support      = true
  enable_dns_hostnames    = true
  tags = {
    "Name"        = "MyVPC"
    "Environment" = "Production"
  }
  project_name            = "my-project"
  environment             = "prod"
  region                  = "us-west-2"

  # Subnets variables
  public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  app_subnet_cidr_blocks    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones        = ["us-west-2a", "us-west-2b"]
  map_public_ip_on_launch  = true

  # Public Route Table variables
  public_routes = {
    "route1" = {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw-1234567890abcdef0"
    }
  }

  # Private Route Table variables
  private_routes = {
    "route1" = {
      cidr_block = "0.0.0.0/0"
      gateway_id = "nat-1234567890abcdef0"
    }
  }
}
