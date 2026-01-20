
resource "aws_customer_gateway" "cgw_on_prem_1a" {
  bgp_asn    = 65000
  ip_address = aws_eip.eip-on-prem-1a.public_ip
  type       = "ipsec.1"
  tags = {
    Name = "cgw-on-prem-1a"
  }
}
