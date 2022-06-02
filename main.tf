provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # default
}

resource "aws_instance" "nginx" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  private_ip             = var.private_ip_nginx[0]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = file("nginx.sh")
  vpc_security_group_ids = [aws_security_group.nginx.id]
  key_name               = aws_key_pair.demo.key_name
  tags = {
    Name = "${var.prefix}-nginx"
    Env  = "f5"
  }
}

