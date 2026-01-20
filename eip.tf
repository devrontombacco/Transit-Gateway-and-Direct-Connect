
resource "aws_eip" "eip-on-prem-1a" {
  instance = aws_instance.ec2-on-prem-1a.id
  domain   = "vpc"

  tags = {
    Name = "eip-on-prem-1a"
  }

}
