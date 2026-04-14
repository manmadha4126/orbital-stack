resource "aws_eks_cluster" "main" {
  name     = "orbital-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.xlarge"]

  scaling_config {
    desired_size = 5
    max_size     = 15
    min_size     = 3
  }
}