provider "my_vpc" {
  region = "eu-west-2" # Change to your AWS region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16" # Update the CIDR block as needed
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24" # Update the CIDR block as needed
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2" # Change to your availability zone

  tags = {
    Name = "my_subnet"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }

  tags = {
    Name = "my_route_table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}
