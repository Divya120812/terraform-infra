environment   = "dev"
subnet_id     = "subnet-0abc123456789def"
instance_type = "t3.micro"
allow_ssh_cidr = "0.0.0.0/0"
key_name      = "my-keypair"

tags = {
  Project     = "terraform-infra"
  Environment = "dev"
  Owner       = "Divya"
}
