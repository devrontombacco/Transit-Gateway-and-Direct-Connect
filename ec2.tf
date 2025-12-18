
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
  subnet_id     = aws_subnet.subnet-1a.vpc_id
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "ec2-b1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet-1b.vpc_id
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "ec2-c1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet-1c.vpc_id
  # security_groups = [ Will insert SG next ] 

  tags = {
    Name = "HelloWorld"
  }
}
