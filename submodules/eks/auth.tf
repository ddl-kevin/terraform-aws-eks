locals {
  eks_master_roles = [for role, arn in [aws_iam_role.eks_cluster] : {
    rolearn  = arn,
    username = role,
    groups   = ["system:masters"]
  }]
  eks_node_roles = [for arn in [aws_iam_role.eks_nodes] : {
    rolearn  = arn,
    username = "system:node:{{EC2PrivateDNSName}}",
    groups   = ["system:bootstrappers", "system:nodes"]
  }]
  map_roles = concat(local.eks_master_roles, local.eks_node_roles)
}

resource "kubernetes_config_map" "aws_auth" {
  count = var.direct_configuration ? 1 : 0

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    maproles = yamlencode(local.map_roles)
  }

  lifecycle {
    ignore_changes = [data]
  }
}