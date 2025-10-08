variable "instance_type"  { default = "t3.micro" }
variable "key_name"       { default = null }          # or "your-keypair"
variable "allow_ssh_cidr" { default = "0.0.0.0/0" }   # tighten for security
