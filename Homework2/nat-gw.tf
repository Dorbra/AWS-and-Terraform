resource "aws_nat_gateway" "gw1" {
  # Elastic IP for the gateway
  allocation_id = aws_eip.nat1.id
  # Subnet which to place the gateway
  subnet_id = aws_subnet.pub_1.id

  tags = {
    Name = "gw NAT 1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.

  #  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "gw2" {
  # Elastic IP for the gateway
  allocation_id = aws_eip.nat2.id
  # Subnet which to place the gateway 
  subnet_id = aws_subnet.pub_2.id

  tags = {
    Name = "gw NAT 2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.

  # depends_on = [aws_internet_gateway.main]
}

output "nat-gw1" {
  value       = aws_nat_gateway.gw1.allocation_id
  description = "NAT GW1"
}
output "nat-gw2" {
  value       = aws_nat_gateway.gw2.allocation_id
  description = "NAT GW2"
}
