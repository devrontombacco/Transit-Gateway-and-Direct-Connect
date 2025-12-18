
resource "aws_route_table" "vpc-a-rt" {
  vpc_id = aws_vpc.vpc-a.id

  # Route to vpc-b via TGW
  route {
    cidr_block         = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  # Route to VPC-C via TGW
  route {
    cidr_block         = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "vpc-a-rt"
  }
}

