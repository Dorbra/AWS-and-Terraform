resource "aws_subnet" "pub_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.1.0/24"
  # REGION us-east AZ 1a
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "whiskey-pub1-us-east-1a"

  }
}

resource "aws_subnet" "pub_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.0/24"
  # REGION us-east AZ 1b
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true

  tags = {
    Name = "whiskey-pub2-us-east-1b"

  }
}

resource "aws_subnet" "priv_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.3.0/24"
  # REGION us-east AZ 1a
  availability_zone = "us-east-1a"

  tags = {
    Name = "whiskey-priv1-us-east-1a"

  }
}

resource "aws_subnet" "priv_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.4.0/24"
  # REGION us-east AZ 1b
  availability_zone = "us-east-1b"

  tags = {
    Name = "whiskey-priv2-us-east-1b"

  }
}

output "subnet_id-pub_1" {
  value       = aws_subnet.pub_1.id
  description = "Subnet id."
}

output "subnet_id-pub_2" {
  value       = aws_subnet.pub_2.id
  description = "Subnet id."
}
