resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "terraform-cloud"
  }
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "terraform-cloud-subnet"
  }
}