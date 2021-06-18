provider "aws" {
    region = "${var.aws_region}"
}

# VPC
resource "aws_vpc" "kub_vpc" {
  cidr_block              = var.vpc_cidr
  tags = {
    Name = "kubVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "kub_igw" {
  vpc_id                  = aws_vpc.kub_vpc.id
  tags = {
    Name = "kubIGW"
  }
}


# Subnets : public
resource "aws_subnet" "kub_sub01" {
  vpc_id                  = aws_vpc.kub_vpc.id
  cidr_block              = var.subnets_cidr
  availability_zone       = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name = "kub_sub01"
  }
}


resource "aws_route" "kub_route" {
  route_table_id          = "${aws_vpc.kub_vpc.main_route_table_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.kub_igw.id}"
}


