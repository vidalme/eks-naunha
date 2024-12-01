resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(var.tags, { "Name" = format("%s-route-table", var.app_name) })

}