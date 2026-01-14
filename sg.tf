
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow inbound SSH from my IP + outbound all"
  vpc_id      = aws_vpc.vpc-a.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_address}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}

resource "aws_security_group" "private-ec2-b-sg" {
  name        = "private-ec2-b-sg"
  description = "Allow inbound SSH and ICMP from Bastion"
  vpc_id      = aws_vpc.vpc-b.id

  ingress {
    description = "Allow SSH from vpc-a"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Allow ICMP from all vpcs"
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = [
      "10.0.0.0/16", # vpc-a
      "10.2.0.0/16"  # vpc-c
    ]
  }

  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "private-ec2-c-sg" {
  name        = "private-ec2-c-sg"
  description = "Allow inbound SSH and ICMP from Bastion"
  vpc_id      = aws_vpc.vpc-c.id

  ingress {
    description = "Allow SSH from vpc-a"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Allow ICMP from all vpcs"
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = [
      "10.0.0.0/16", # vpc-a
      "10.1.0.0/16", # vpc-b
    ]
  }

  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
