##################################################################################
# VARIABLES
##################################################################################

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region" {
  default = "us-east-1"
}
variable "instance_count" {
  default = 2
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

##################################################################################
# DATA
##################################################################################

data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


##################################################################################
# RESOURCES
##################################################################################

#This uses the default VPC.  It WILL NOT delete it on destroy.
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_ssh" {
  name        = "nginx_demo"
  description = "Allow ports for nginx demo"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  count                  = var.instance_count
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  ebs_block_device {
    device_name = "/dev/sda1"
    encrypted   = true
    volume_size = 10
    volume_type = "gp2"
  }
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name    = "whiskey-${count.index + 1}"
    Purpose = "grandpa"
    Owner   = "doron.brand"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)

  }


  provisioner "file" {
    source = "./index.html"
    #destination = "/tmp/share/nginx/html/"
    destination = "/var/tmp/index.html"

    connection {
      type        = "ssh"
      host        = self.public_dns
      user        = "ec2-user"
      private_key = file(var.private_key_path)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
      "sudo cp /var/tmp/index.html /usr/share/nginx/html/index.html"
    ]
  }

}


##################################################################################
# OUTPUT
##################################################################################

# output "aws_instance_public_dns" {
#   value = aws_instance.nginx.public_dns
# }
