resource "aws_route_table_association" "public1" {
  # subnet to associate
  subnet_id = aws_subnet.pub_1.id

  # Routing Table to associate
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  # subnet to associate
  subnet_id = aws_subnet.pub_2.id

  # Routing Table to associate
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  # subnet to associate
  subnet_id = aws_subnet.priv_1.id

  # Routing Table to associate
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  # subnet to associate
  subnet_id = aws_subnet.priv_2.id

  # Routing Table to associate
  route_table_id = aws_route_table.private2.id
}
