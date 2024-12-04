resource "aws_ecr_repository" "this" {
  count                = length(var.ecr)
  name                 = var.ecr[count.index].name
  image_tag_mutability = var.ecr[count.index].image_tag_mutability
  force_delete         = true
} 