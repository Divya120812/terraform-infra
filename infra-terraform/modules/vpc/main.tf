data "aws_availability_zones" "azs" { state = "available" }

locals {
  tags = merge({ Environment = var.environment, ManagedBy = "terraform" }, var.tags)
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(local.tags, { Name = "vpc-${var.environment}" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.tags, { Name = "igw-${var.environment}" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route { cidr_block = "0.0.0.0/0"; gateway_id = aws_internet_gateway.igw.id }
  tags = merge(local.tags, { Name = "rtb-public-${var.environment}" })
}

resource "aws_subnet" "public" {
  for_each                  = { for i, cidr in var.public_cidrs : i => cidr }
  vpc_id                    = aws_vpc.this.id
  cidr_block                = each.value
  availability_zone         = data.aws_availability_zones.azs.names[tonumber(each.key) % length(data.aws_availability_zones.azs.names)]
  map_public_ip_on_launch   = true
  tags = merge(local.tags, { Name = "public-${each.key}-${var.environment}" })
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
