
resource "aws_vpn_connection" "vpn_on_prem_1a" {
  customer_gateway_id = aws_customer_gateway.cgw_on_prem_1a.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "vpn-on-prem-1a"
  }
}

resource "aws_ec2_transit_gateway_route" "route_to_onprem" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
  destination_cidr_block         = "10.100.0.0/16"
  transit_gateway_attachment_id  = aws_vpn_connection.vpn_on_prem_1a.transit_gateway_attachment_id
}
