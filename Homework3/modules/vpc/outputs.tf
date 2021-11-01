output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "subnet_id-public" {
  value = {
    for k, v in aws_subnet.public : k => v.id
  }
}

output "subnet_cidr-public" {
  value = {
    for k, v in aws_subnet.public : k => v.cidr_block
  }
}

output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}

output "subnet_id-private" {
  value = {
    for k, v in aws_subnet.private : k => v.id
  }
}

output "subnet_cidr-private" {
  value = {
    for k, v in aws_subnet.private : k => v.cidr_block
  }
}

output "private_subnets_ids" {
  value = aws_subnet.private.*.id
}

output "igw_id" {
  value       = aws_internet_gateway.main.id
  description = "IGW id"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}
