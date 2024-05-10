########### Create VPC with 2 public ad two Private subnet ###########
module "vpc" {
  source = "../../modules/aws-vpc"

  # VPC variables
  vpc_cidr_block       = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.vpc_tags
  project_name         = var.project_name
  environment          = var.environment
  region               = var.region

  # Subnets variables
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  app_subnet_cidr_blocks    = var.app_subnet_cidr_blocks
  availability_zones        = var.availability_zones
  map_public_ip_on_launch   = var.map_public_ip_on_launch

  # Public Route Table variables
  public_routes = {
    "route1" = {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.vpc.internet_gateway_id
    }
  }


  # Private Route Table variables
  private_routes = {
    "route1" = {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.vpc.nat_gateway_id
    }
  }

  create_nat_gateway = var.create_nat_gateway

}


module "iam-policy" {
  source               = "../../modules/iam-policy"
  iam_policy_json_file = var.iam_policy_json_file
  environment          = var.environment
  application          = var.application
}

module "ec2" {
  source                      = "../../modules/ec2"
  ami_id                      = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  instance_count              = var.instance_count
  subnet_ids                  = module.vpc.public_subnet_ids
  associate_public_ip_address = var.associate_public_ip_address
  attach_instance_profile     = var.attach_instance_profile
  iam_role                    = module.iam-policy.iam_role
  security_group_ids          = module.security-group.security_group_ids
  attach_eip                  = var.attach_eip
  storage_size                = var.storage_size
  environment                 = var.environment
  application                 = var.application
  tags                        = var.tags
}

module "security-group" {
  source = "../../modules/security-group"
  region = var.region
  vpc_id = module.vpc.vpc_id

  ingress_cidr_from_port     = var.ingress_cidr_from_port
  ingress_cidr_to_port       = var.ingress_cidr_to_port
  ingress_cidr_protocol      = var.ingress_cidr_protocol
  ingress_cidr_block         = var.ingress_cidr_block
  create_ingress_cidr        = var.create_ingress_cidr
  ingress_sg_from_port       = var.ingress_sg_from_port
  ingress_sg_to_port         = var.ingress_sg_to_port
  ingress_sg_protocol        = var.ingress_sg_protocol
  ingress_security_group_ids = var.ingress_security_group_ids
  create_ingress_sg          = var.create_ingress_sg
  egress_cidr_from_port      = var.egress_cidr_from_port
  egress_cidr_to_port        = var.egress_cidr_to_port
  egress_cidr_protocol       = var.egress_cidr_protocol
  egress_cidr_block          = var.egress_cidr_block
  create_egress_cidr         = var.create_egress_cidr
  egress_sg_from_port        = var.egress_sg_from_port
  egress_sg_to_port          = var.egress_sg_to_port
  egress_sg_protocol         = var.egress_sg_protocol
  egress_security_group_ids  = var.egress_security_group_ids
  create_egress_sg           = var.create_egress_sg

  environment = var.environment

  application = var.application
}
