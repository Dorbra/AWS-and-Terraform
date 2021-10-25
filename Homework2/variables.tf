variable "private_key_path" {
  type    = string
  default = "./nginx_creds.pem"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "elb_availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]

}

variable "key_name" {
  type    = string
  default = "nginx_creds"

}