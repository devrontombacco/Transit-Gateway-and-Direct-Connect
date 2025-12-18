
resource "aws_route_table" "vpc-a-rt" {
  vpc_id = aws_vpc.vpc-a.id

  # Route to vpc-b via TGW
  route {
    cidr_block         = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  # Route to vpc-c via TGW
  route {
    cidr_block         = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "vpc-a-rt"
  }
}

resource "aws_route_table" "vpc-b-rt" {
  vpc_id = aws_vpc.vpc-b.id

  # Route to vpc-a via TGW
  route {
    cidr_block         = "10.0.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  # Route to vpc-c via TGW
  route {
    cidr_block         = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "vpc-b-rt"
  }
}

resource "aws_route_table" "vpc-c-rt" {
  vpc_id = aws_vpc.vpc-c.id

  # Route to vpc-a via TGW
  route {
    cidr_block         = "10.0.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  # Route to vpc-b via TGW
  route {
    cidr_block         = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "vpc-b-rt"
  }
}


resource "aws_route_table_association" "rt-assoc-a" {
  subnet_id      = aws_subnet.subnet-1a.id
  route_table_id = aws_route_table.vpc-a-rt.id
}

resource "aws_route_table_association" "rt-assoc-b" {
  subnet_id      = aws_subnet.subnet-1b.id
  route_table_id = aws_route_table.vpc-b-rt.id
}

resource "aws_route_table_association" "rt-assoc-c" {
  subnet_id      = aws_subnet.subnet-1c.id
  route_table_id = aws_route_table.vpc-c-rt.id
}
