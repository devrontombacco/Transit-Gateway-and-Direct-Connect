
resource "aws_vpn_connection" "vpn_on_prem_1a" {
  customer_gateway_id = aws_customer_gateway.cgw_on_prem_1a.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "vpn-on-prem-1a"
  }
}


