data "aws_availability_zones" "available" {
  state = "available"
}

variable "vpc_id" {}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones_count" {
  type        = number
  description = "number of available AZ"
}

# variable "public_subnet_numbers" {
#   type        = map(number)
#   description = "Map of AZ > numbers, that should be used for Public subnets"

#   default = {
#     "us-east-1a" = 1
#     "us-east-1b" = 2
#   }

# }

# variable "private_subnet_numbers" {

#   type        = map(number)
#   description = "Map of AZ > numbers, that should be used for Private subnets"

#   default = {
#     "us-east-1a" = 3
#     "us-east-1b" = 4
#   }
# }
