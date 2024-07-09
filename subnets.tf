variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet.id]
}
