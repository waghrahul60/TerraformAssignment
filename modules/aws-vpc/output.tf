output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway[0].id
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnet[*].id
  description = "List of private subnet IDs"
}


output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The CIDR block associated with the VPC"
}

