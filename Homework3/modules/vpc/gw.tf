
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "whiskey-igw"
  }
}

resource "aws_eip" "nat_eip" {
  count = length(aws_subnet.public[*].id)

  tags = {
    Name = "nat_eip-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "nat_gw" {
  count = length(aws_subnet.public[*].id)

  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "gw-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.main]
}
