resource "aws_vpc" "odoo-base" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "odoo-base"
  }
}

resource "aws_internet_gateway" "odoo-base" {
  vpc_id = aws_vpc.odoo-base.id
  tags = {
    Name = "odoo-base"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.odoo-base.id
  cidr_block              = "192.168.20.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "odoo-public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.odoo-base.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.odoo-base.id
  }
  tags = {
    Name = "odoo-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.odoo-base.id
  cidr_block              = "192.168.30.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "odoo-base-private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.odoo-base.id
  cidr_block              = "192.168.40.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "odoo-base-private-2"
  }
}