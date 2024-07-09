variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main-igw"
  }
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main_igw.id
}
