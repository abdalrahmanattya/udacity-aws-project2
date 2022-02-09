# TODO: Designate a cloud provider, region, and credentials

provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "udacity"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
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

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "udacity_T2" {
  ami           = data.aws_ami.ubuntu.id
  count = 4
  instance_type = "t2.micro"

  tags = {
    Name = "udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4

