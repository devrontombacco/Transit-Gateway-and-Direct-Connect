
resource "aws_subnet" "subnet-1a" {
  vpc_id                  = aws_vpc.vpc-a.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1a"
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


resource "aws_subnet" "subnet-1c" {
  vpc_id                  = aws_vpc.vpc-c.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1c"
  }
}
