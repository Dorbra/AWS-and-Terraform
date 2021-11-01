##################################################################################
# VPC
##################################################################################
module "vpc" {
  source                   = "../modules/vpc"
  vpc_id                   = module.vpc.vpc_id
  vpc_cidr                 = var.vpc_cidr
  availability_zones_count = var.availability_zones_count
}

output "VPC" {
  value = module.vpc.*
}

##################################################################################
# APP
##################################################################################
module "app" {
  source                = "../modules/app"
  vpc_id                = module.vpc.vpc_id
  available_zone_names  = module.vpc.availability_zones
  public_subnets_ids    = module.vpc.public_subnets_ids
  private_subnets_ids   = module.vpc.private_subnets_ids
  instance_count        = var.instance_count
  instance_type_web     = var.instance_type
  instance_type_db      = var.instance_type
  s3_bucket_region_name = var.aws_region
}

output "APP" {
  value = module.app.*
}
