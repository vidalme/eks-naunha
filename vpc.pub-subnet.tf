resource "aws_subnet" "publics" {

  count                   = length(var.vpc.pub-subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.vpc.pub-subnets[count.index].cidr_block
  availability_zone       = var.vpc.pub-subnets[count.index].availability_zone
  map_public_ip_on_launch = true
  # map_public_ip_on_launch = var.vpc.pub-subnets[count.index].map_public_ip_on_launch


  tags = merge(var.tags, { "Name" = format("%s-public-subnet-%s", var.app_name, count.index) })
}

# route table



resource "aws_route_table_association" "pub-d" {
  count          = length(var.vpc.pub-subnets)
  subnet_id      = aws_subnet.publics[count.index].id
  route_table_id = aws_route_table.public.id
}
