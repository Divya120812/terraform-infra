variable "environment"     { type = string }
variable "subnet_id"       { type = string }
variable "instance_type"   { type = string }
variable "allow_ssh_cidr"  { type = string, default = "0.0.0.0/0" }
variable "key_name"        { type = string, default = null }
variable "tags"            { type = map(string), default = {} }
