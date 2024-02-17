# Create EC2 Instance - Amazon Linux
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] #ubuntu
}

resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorlds"
  }
}

data "aws_ami" "ubuntu-west-2" {
  provider = aws.west-2
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] #ubuntu
}

resource "aws_instance" "web-west-2" {
  provider = aws.west-2
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorlds"
  }
}