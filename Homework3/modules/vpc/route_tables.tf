##################
##### Public #####
##################
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public"
  }
}

resource "aws_route" "route_to_igw" {
  route_table_id         = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id

  depends_on = [aws_route_table.route_table_public]
}

resource "aws_route_table_association" "route_table_association_public" {
  count          = length(aws_subnet.public[*].id)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.route_table_public.id

}

##################
##### Private ####
##################
resource "aws_route_table" "route_table_private" {
  count  = var.availability_zones_count
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "route_table_private-${count.index + 1}"
  }
}

resource "aws_route" "route_to_nat_gw" {
  count                  = length(aws_route_table.route_table_private[*].id)
  route_table_id         = aws_route_table.route_table_private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
}

resource "aws_route_table_association" "route_table_association_private" {
  count          = length(aws_subnet.private[*].id)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.route_table_private[count.index].id
}
