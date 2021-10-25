resource "aws_instance" "web1" {

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pub_1.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  availability_zone      = "us-east-1a"
  key_name               = var.key_name

  user_data = file("nginx-init.sh")

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
      "sudo rm /usr/share/nginx/html/index.html",
      "echo '<html><head><title>Doron Brand Whiskey</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Welcom to Grandpas Whiskey</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html"
    ]
  }

  tags = {
    Name    = "ec2_web1"
    Purpose = "whiskey_hw2"
    Owner   = "Dorbra"
  }
}

resource "aws_instance" "web2" {

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pub_2.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  availability_zone      = "us-east-1b"
  key_name               = var.key_name

  user_data = file("nginx-init.sh")

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
      "sudo rm /usr/share/nginx/html/index.html",
      "echo '<html><head><title>Doron Brand Whiskey</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Welcom to Grandpas Whiskey</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html"
    ]
  }

  tags = {
    Name    = "ec2_web2"
    Purpose = "whiskey_hw2"
    Owner   = "Dorbra"
  }
}

resource "aws_instance" "db01" {

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.priv_1.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  availability_zone      = "us-east-1a"
  key_name               = var.key_name

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)

  }

  tags = {
    Name    = "ec2_db01"
    Purpose = "whiskey_hw2"
    Owner   = "Dorbra"
  }
}

resource "aws_instance" "db02" {

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.priv_2.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  availability_zone      = "us-east-1b"
  key_name               = var.key_name

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)

  }

  tags = {
    Name    = "ec2_db02"
    Purpose = "whiskey_hw2"
    Owner   = "Dorbra"
  }
}
