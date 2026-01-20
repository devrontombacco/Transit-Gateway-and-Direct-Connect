
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-a.id

  tags = {
    Name = "igw"
  }
}

resource "aws_internet_gateway" "igw-on-prem" {
  vpc_id = aws_vpc.vpc-on-prem.id

  tags = {
    Name = "igw-on-prem"
  }
}
