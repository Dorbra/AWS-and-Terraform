
resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  # makes instance shared on host
  instance_tenancy = "default"
  tags = {
    Name = "whiskey-vpc"
  }

}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC id."

}
