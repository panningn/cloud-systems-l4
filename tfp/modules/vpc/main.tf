resource "aws_vpc" "new_vpc"{
    cidr_block                       = var.cidr_block
    enable_dns_support               = true
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags   = { Name = "igw-${var.name}" }
}

resource "aws_route_table" "public_RT_new_vpc" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "Public-RT-${var.name}" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-PUB" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.private_cidr
  availability_zone = var.az
  tags              = { Name = "SN-PRIV" }
}

resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_RT_new_vpc.id
}