data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

 dynamic "ebs_block_device" {
   for_each = var.blocks
   content {
     device_name = ebs_block_device.value["device_name"]
     volume_type = ebs_block_device.value["volume_type"]
     volume_size = ebs_block_device.value["volume_size"]
   }
 }

  tags = {
    Name = "Hello, %{ if var.name == "pmacoy"}${var.name}%{else}não valeu%{endif}!"
  }
  depends_on = [ aws_instance.web ]
}
