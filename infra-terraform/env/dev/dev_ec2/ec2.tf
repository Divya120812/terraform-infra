module "ec2" {
  source         = "../../../modules/ec2"
  environment    = var.environment
  subnet_id      = modules.vpc.public_subnet_ids[0]      #var.public_subnet_cidrs
  instance_type  = var.instance_type
  key_name       = var.key_name
  allow_ssh_cidr = var.allow_ssh_cidr
  tags           = var.tags
}

output "instance_id" { value = modules.ec2.instance_id }
output "public_ip"   { value = modules.ec2.public_ip }
