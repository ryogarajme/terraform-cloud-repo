resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "terraform-cloud"
  }
}