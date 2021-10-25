resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "whiskey-igw"
  }
}


output "igw_id" {
  value       = aws_internet_gateway.main.id
  description = "IGW id."
}
