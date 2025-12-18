
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

resource "aws_instance" "ec2-a1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet-1a.id
  key_name      = "MY_EC2_INSTANCE_KEYPAIR"
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "ec2-a1"
  }
}

resource "aws_instance" "ec2-b1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet-1b.id
  key_name      = "MY_EC2_INSTANCE_KEYPAIR"
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "ec2-b1"
  }
}

resource "aws_instance" "ec2-c1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet-1c.id
  key_name      = "MY_EC2_INSTANCE_KEYPAIR"
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "ec2-c1"
  }
}
