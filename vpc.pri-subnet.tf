resource "aws_subnet" "privates" {

  count             = length(var.vpc.pri-subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc.pri-subnets[count.index].cidr_block
  availability_zone = var.vpc.pri-subnets[count.index].availability_zone

  tags = merge(var.tags, { "Name" = format("%s-private-subnet-%s", var.app_name, count.index) })
}

