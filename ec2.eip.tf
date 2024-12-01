resource "aws_eip" "this" {
  domain = "vpc"
  tags   = merge(var.tags, { "Name" = format("%s-eip", var.app_name) })
}