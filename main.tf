
provider "aws" {
  region = "eu-west-1"
}


resource "aws_vpc" "vpc-a" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-a"
  }

}

resource "aws_subnet" "subnet-1a" {
  vpc_id                  = aws_vpc.vpc-a.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1a"
  }
}

resource "aws_vpc" "vpc-b" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpc-b"
  }

}

resource "aws_subnet" "subnet-1b" {
  vpc_id                  = aws_vpc.vpc-b.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1b"
  }
}

resource "aws_vpc" "vpc-c" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "vpc-c"
  }

}

resource "aws_subnet" "subnet-1c" {
  vpc_id                  = aws_vpc.vpc-c.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1c"
  }
}


resource "aws_ec2_transit_gateway" "this" {
  description     = "main-tgw"
  amazon_side_asn = 64512

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  dns_support                     = "enable"

  tags = {
    Name        = "main-tgw"
    Environment = "prod"
  }
}

