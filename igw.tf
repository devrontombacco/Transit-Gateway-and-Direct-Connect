
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-a.id

  tags = {
    Name = "igw"
  }
}
