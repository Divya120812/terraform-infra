variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "allow_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for EC2 resources"
  type        = map(string)
  default     = {}
}
