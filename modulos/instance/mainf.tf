provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "platzi-backend" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "platzi-backend_acl" {
    bucket = aws_s3_bucket.platzi-backend.id
    acl = var.acl
    }

resource "aws_security_group" "ssh_connection" {
  name = var.sg_name
  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
resource "aws_instance" "platzi-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  tags            = var.tags
  security_groups = ["${aws_security_group.ssh_connection.name}"]
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("./private-key")}"
      host = self.public_ip
    }
    inline = ["echo hello", "docker run -it -d -p 80:80 joaparrilla/hello-platzi:v1"]
    
  }
}