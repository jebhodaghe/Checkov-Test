resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
