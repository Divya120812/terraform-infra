variable "environment"   { type = string }
variable "vpc_cidr"      { type = string }
variable "public_cidrs"  { type = list(string) }
variable "tags"          { type = map(string), default = {} }
