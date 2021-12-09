data "aws_ami" "debian-10" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
resource "aws_instance" "odoo-1" {
  ami               = data.aws_ami.debian-10.id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  security_groups   = [aws_security_group.odoo.id]
  subnet_id         = aws_subnet.public.id
  key_name          = "odoo-key"

  tags = {
    Name = "odoo-base"
  }
}