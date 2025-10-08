module "ec2" {
  source         = "../../../modules/ec2"
  environment    = var.environment
  subnet_id      = module.vpc.public_subnet_ids[0]
  instance_type  = var.instance_type
  key_name       = var.key_name
  allow_ssh_cidr = var.allow_ssh_cidr
  tags           = var.tags
}

output "instance_id" { value = module.ec2.instance_id }
output "public_ip"   { value = module.ec2.public_ip }
