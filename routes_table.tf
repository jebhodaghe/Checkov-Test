variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type        = list(string)
}

variable "internet_gateway_id" {
  description = "The ID of the internet gateway"
  type        = string
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  for_each       = toset(var.public_subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.public_rt.id
}
