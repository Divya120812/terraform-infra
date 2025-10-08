environment   = "dev"
subnet_id     = "subnet-0abc123456789def"   # Replace with your actual subnet ID
instance_type = "t3.micro"
allow_ssh_cidr = "0.0.0.0/0"       # Restrict SSH to your IP
key_name      = "my-keypair"

tags = {
  Project     = "terraform-infra"
  Environment = "dev"
  Owner       = "Divya"
}
