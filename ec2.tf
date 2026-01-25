
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2-a1-bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet-1a.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "ec2-a1"
  }
}

resource "aws_instance" "ec2-b1" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.subnet-1b.id
  key_name        = "MY_EC2_INSTANCE_KEYPAIR"
  security_groups = [aws_security_group.private-ec2-b-sg.id]

  tags = {
    Name = "ec2-b1"
  }
}

resource "aws_instance" "ec2-c1" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.subnet-1c.id
  key_name        = "MY_EC2_INSTANCE_KEYPAIR"
  security_groups = [aws_security_group.private-ec2-c-sg.id]

  tags = {
    Name = "ec2-c1"
  }
}

resource "aws_instance" "ec2-on-prem-1a" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3.micro"
  subnet_id         = aws_subnet.subnet-on-prem-1a.id
  key_name          = "MY_EC2_INSTANCE_KEYPAIR"
  security_groups   = [aws_security_group.ec2-on-prem-1a-sg.id]
  user_data_base64  = base64encode(templatefile("user_data.sh", {}))
  source_dest_check = false

  tags = {
    Name = "ec2-on-prem-1a"
  }
}
