resource "aws_route_table" "public" {

  count  = length(var.vpc.pub-subnets)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(var.tags, {
    Name = format("%s-public-route-table", var.app_name)
  })
}