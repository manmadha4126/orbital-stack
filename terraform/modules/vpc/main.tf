resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "orbital-vpc"
    Project = "orbital-stack"
  }
}

resource "aws_subnet" "public" {
  count = 3
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
}