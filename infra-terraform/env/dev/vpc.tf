module "vpc" {
  source        = "../../modules/vpc"
  environment   = var.environment
  vpc_cidr      = var.vpc_cidr
  public_cidrs  = var.public_cidrs
  tags          = var.tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
