variable "private_key_path" {
  type    = string
  default = "./terraform_key.pem"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones_count" {
  type        = number
  description = "number of available AZ"
}

variable "public_subnet_count" {
  type    = number
  default = 2
}

variable "private_subnet_count" {
  type    = number
  default = 2
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "instance_type" {
  default = "t2.micro"
}

variable "elb_availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]

}

variable "key_name" {
  type    = string
  default = "terraform_key"
}
