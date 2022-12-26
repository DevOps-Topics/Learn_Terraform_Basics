resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_cidr
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.main_subnet

}

output "main_vpc_id" {
  value       = aws_vpc.main_vpc.id

}


output "main_subnet_id" {
  value       = aws_subnet.main_subnet.id

}