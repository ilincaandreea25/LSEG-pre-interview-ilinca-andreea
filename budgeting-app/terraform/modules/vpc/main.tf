# Define VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "main"
  }
}

# Public Subnets (create 2 public subnets)
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  map_public_ip_on_launch = true
}

# Private Subnets (create 2 private subnets)
resource "aws_subnet" "private" {
  count      = 2
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + 2)
}

# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
}

# NAT Gateway in the first public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Route table for private subnets with a route through the NAT Gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
