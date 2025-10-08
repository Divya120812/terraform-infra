# Always fetch latest Amazon Linux 2023 x86_64 (no AMI hardcode)
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  
filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
  
filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

locals {
  tags = merge({ Environment = var.environment, ManagedBy = "terraform" }, var.tags)
}

resource "aws_security_group" "ssh_http" {
  name   = "sg-ssh-http-${var.environment}"
  vpc_id = data.aws_subnet.selected.vpc_id

  
ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allow_ssh_cidr]
  }

  ingress { 
     from_port = 80 
     to_port   = 80
     protocol = "tcp" 
     cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
     from_port = 0 
     to_port = 0 
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"] 
  }
  tags = local.tags
 }

data "aws_subnet" "selected" {
    id = var.subnet_id 
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = merge(var.tags, { Name = "${var.environment}-ec2" })
}
