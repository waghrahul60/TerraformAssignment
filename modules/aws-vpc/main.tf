################# Creating VPC ###################
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(local.default_tags, var.tags)

}

################# Creating VPC ###################
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(local.default_tags, var.tags, { Name = "Public Subnet" })
}

resource "aws_route_table_association" "public_subnet" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.app_subnet_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.app_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags              = merge(local.default_tags, var.tags, { Name = "Private Subnet" })

}

resource "aws_route_table_association" "private_subnet" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}


#################  Route Table #################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  dynamic "route" {
    for_each = var.public_routes

    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = merge(local.default_tags, var.tags, { Name = "Public Route Table" })

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  dynamic "route" {
    for_each = var.private_routes

    content {
      cidr_block     = route.value.cidr_block
      nat_gateway_id = route.value.gateway_id
    }
  }

  tags = merge(local.default_tags, var.tags, { Name = "Private Route Table" })

}

#################  IGW #################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, var.tags, { Name = "IGW" })

}

############## NAT Gateway ##############
resource "aws_eip" "eip" {
  count  = var.create_nat_gateway ? 1 : 0
  domain = local.domain
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_internet_gateway.igw]
  tags = merge(local.default_tags, var.tags, { Name = "Nat Gateway" })

}
