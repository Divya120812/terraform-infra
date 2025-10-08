module "vpc" {
  source        = "../../../modules/vpc"
  region        = var.region
  environment   = var.environment
  vpc_cidr      = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags          = var.tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
