resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }
  tags = merge(var.tags, { "Name" = format("%s-route-table", var.app_name) })

}

resource "aws_route_table_association" "private" {
  count          = length(var.vpc.pri-subnets)
  subnet_id      = aws_subnet.privates[count.index].id
  route_table_id = aws_route_table.private.id
}
