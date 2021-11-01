
variable "vpc_id" {
  type = string
}

variable "s3_bucket_region_name" {
  type = string
}

variable "s3_logs_bucket_name" {
  type    = string
  default = "web-servers-logs-bucket"
}

variable "public_subnets_ids" {
  description = "Public Subnet Ids"
  type        = list(string)
}

variable "private_subnets_ids" {
  description = "Private Subnet Ids"
  type        = list(string)
}

variable "available_zone_names" {
  description = "AZ Names"
  type        = list(string)
}

variable "instance_count" {
  description = "EC2 Instance count"
  type        = number
}

variable "instance_type_db" {
  description = "DB EC2 Instance Type"
  type        = string
}

variable "instance_type_web" {
  description = "Web EC2 Instance Type"
  type        = string
}

variable "private_key_path" {
  type    = string
  default = "terraform_key.pem"
}

variable "key_name" {
  type    = string
  default = "terraform"
}


