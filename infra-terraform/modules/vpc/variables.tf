variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment"     { type = string }

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
}
