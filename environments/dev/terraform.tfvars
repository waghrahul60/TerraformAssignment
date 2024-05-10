project_name = "my-task-project"
environment  = "dev"
region       = "us-east-1"


############# VPC variables ###################
vpc_cidr_block       = "10.0.0.0/16"
instance_tenancy     = "default"
enable_dns_support   = true
enable_dns_hostnames = true



public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
app_subnet_cidr_blocks    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones        = ["us-east-1a", "us-east-1b"]
map_public_ip_on_launch   = true


vpc_tags = {
  "Name"        = "MyTaskVPC"
  "Environment" = "dev"
}
create_nat_gateway = true




####### EC2 Instance Variables #########
instance_type               = "t2.micro"
key_name                    = "MyKey"
instance_count              = 1
associate_public_ip_address = true
attach_instance_profile     = true
attach_eip                  = false
storage_size                = 30
application = "bastion-serevr"
tags = {
  "name" = "value"
}


# CIDR Ingress Variables
create_ingress_cidr    = true
ingress_cidr_from_port = [22, 8080]
ingress_cidr_to_port   = [22, 8080]
ingress_cidr_protocol  = ["tcp", "tcp"]
ingress_cidr_block     = ["0.0.0.0/0", "0.0.0.0/0"]

# Security Group Ingress Variables
create_ingress_sg          = false
ingress_sg_from_port       = [80]
ingress_sg_to_port         = [80]
ingress_sg_protocol        = ["tcp"]
ingress_security_group_ids = ["sg-0fe4363da3994c100"]

# CIDR Egress Variables
create_egress_cidr    = true
egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]

# Security Group Egress Variables
create_egress_sg          = false
egress_sg_from_port       = [0]
egress_sg_to_port         = [0]
egress_sg_protocol        = ["-1"]
egress_security_group_ids = ["sg-0fe4363da3994c100"]

iam_policy_json_file = "ec2_instance.json"