resource "aws_eip" "nat1" {
  # AWS doc:
  # EIP may require IGW to exist prior to association. Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat2" {
  # AWS doc:
  # EIP may require IGW to exist prior to association. Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]
}
