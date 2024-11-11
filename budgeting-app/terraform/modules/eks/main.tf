# resource "aws_eks_cluster" "eks" {
#   name     = "budgeting-app-cluster"
#   role_arn = aws_iam_role.eks_role.arn
#
#   vpc_config {
#     subnet_ids = var.subnet_ids
#     security_group_ids = [aws_security_group.eks_cluster_sg.id]
#   }
# }
#
# resource "aws_iam_role" "eks_role" {
#   name               = "eks-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = { Service = "eks.amazonaws.com" }
#       }
#     ]
#   })
# }
#
# resource "aws_iam_role" "worker_role" {
#   name               = "worker-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = { Service = "ec2.amazonaws.com" }
#       }
#     ]
#   })
# }
#
# resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
#   role       = aws_iam_role.worker_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
# }
#
# resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
#   role       = aws_iam_role.worker_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
# }
#
# resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
#   role       = aws_iam_role.worker_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
# }
#
# resource "aws_security_group" "eks_cluster_sg" {
#   vpc_id = var.vpc_id
#
#   ingress {
#     from_port = 443
#     to_port   = 443
#     protocol  = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
#
# resource "aws_security_group" "eks_worker_sg" {
#   vpc_id = var.vpc_id
#
#   ingress {
#     from_port = 443
#     to_port   = 443
#     protocol  = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     self      = true
#   }
#
#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
#
# resource "aws_eks_node_group" "node_group" {
#   cluster_name  = aws_eks_cluster.eks.name
#   node_role_arn = aws_iam_role.worker_role.arn
#   subnet_ids    = var.subnet_ids
#
#   remote_access {
#     ec2_ssh_key = var.ssh_key_name
#     source_security_group_ids = [aws_security_group.eks_worker_sg.id]
#   }
#
#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }
# }
#
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
# }


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name     = "budgeting-app-cluster"
  cluster_version = "1.31"

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  self_managed_node_groups = {
    example = {
      ami_type      = "AL2_x86_64"
      instance_type = "t2.micro"

      min_size = 1
      max_size = 2
      desired_size = 1
    }
  }
}