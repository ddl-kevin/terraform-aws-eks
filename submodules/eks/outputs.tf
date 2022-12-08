
output "security_group_id" {
  description = "EKS security group id."
  value       = aws_security_group.eks_cluster.id
}

output "nodes_security_group_id" {
  description = "EKS managed nodes security group id."
  value       = aws_security_group.eks_nodes.id
}

output "cluster_endpoint" {
  description = "EKS cluster API endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "eks_node_roles" {
  description = "EKS managed node roles"
  value       = [aws_iam_role.eks_nodes]
}

output "eks_master_roles" {
  description = "EKS master roles."
  value       = [aws_iam_role.eks_cluster]
}

output "eks_cluster_id" {
  value       = aws_eks_cluster.this.id
  description = "EKS Cluster Id / Name"
}
