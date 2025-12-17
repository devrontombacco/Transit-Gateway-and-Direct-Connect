
resource "aws_vpc" "vpc-a" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-a"
  }

}

resource "aws_vpc" "vpc-b" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpc-b"
  }

}

resource "aws_vpc" "vpc-c" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "vpc-c"
  }

}
