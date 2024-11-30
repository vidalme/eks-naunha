resource "aws_vpc" "this" {

  cidr_block       = var.vpc.cidr_block
  instance_tenancy = "default"

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-vpc", var.app_name)
    }
  )
}   