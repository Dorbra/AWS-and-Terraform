
resource "aws_instance" "ec2_web_servers" {
  count                = var.instance_count
  ami                  = data.aws_ami.aws-linux.id
  instance_type        = var.instance_type_web
  key_name             = var.key_name
  availability_zone    = var.available_zone_names[count.index % length(var.available_zone_names)]
  iam_instance_profile = aws_iam_instance_profile.web_instance_profile.id

  network_interface {
    network_interface_id = aws_network_interface.web_network_interfaces[count.index].id
    device_index         = 0
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
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
    Name    = "ec2-web-${count.index + 1}"
    Purpose = "whiskey_hw3"
    Owner   = "Dorbra"
  }

}

resource "aws_network_interface" "web_network_interfaces" {
  count           = var.instance_count
  subnet_id       = var.public_subnets_ids[count.index % length(var.public_subnets_ids)]
  security_groups = [aws_security_group.ec2_instances_access.id]

  tags = {
    Name = "web-network-interface-ec2-${count.index + 1}"
  }
}
