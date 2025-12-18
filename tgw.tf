
resource "aws_ec2_transit_gateway" "tgw" {
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

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-at-vpc-a" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc-a.id
  subnet_ids         = [aws_subnet.subnet-1a.id]
  dns_support        = "enable"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-at-vpc-b" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc-b.id
  subnet_ids         = [aws_subnet.subnet-1b.id]
  dns_support        = "enable"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-at-vpc-c" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc-c.id
  subnet_ids         = [aws_subnet.subnet-1c.id]
  dns_support        = "enable"
}


resource "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-assoc-vpc-a" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-at-vpc-a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-assoc-vpc-b" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-at-vpc-b.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-assoc-vpc-c" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-at-vpc-c.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}
