resource "aws_eks_access_policy_association" "this" {
  cluster_name  = aws_eks_cluster.this.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::703823446403:user/primeiro"

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "this" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = "arn:aws:iam::703823446403:user/primeiro"
  type          = "STANDARD"
}