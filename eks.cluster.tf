# resource "aws_eks_cluster" "this" {
#   name     = format("%s-eks-cluster", var.app_name)
#   role_arn = aws_iam_role.eks_cluster_role.arn

#   vpc_config {
#     subnet_ids = aws_subnet.publics[*].id
#   }
#     enabled_cluster_log_types = ["api","audit","authenticator","controllerManager","scheduler"]
#     access_config {
#       authentication_mode = "API_AND_CONFIG_MAP"
#     }
#   # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
#   # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
#   depends_on = [
#     aws_iam_role_policy_attachment.eks_cluster_role_AmazonEKSClusterPolicy,
#   ]
# }


