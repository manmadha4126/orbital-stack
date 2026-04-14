variable "subnet_ids" {
  type = list(string)
}

resource "aws_eks_cluster" "main" {
  name     = "orbital-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-role"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}