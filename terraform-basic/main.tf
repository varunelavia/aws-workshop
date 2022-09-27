provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "mybucket" {
  bucket = ""
  acl    = "private"
}


resource "aws_instance" "this" {
  count                       = 0
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  subnet_id                   = ""
  vpc_security_group_ids      = [""]
  key_name                    = ""
  associate_public_ip_address = true
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
  tags = { "Name" = "my-terraform-instance-${count.index+1}" }
}