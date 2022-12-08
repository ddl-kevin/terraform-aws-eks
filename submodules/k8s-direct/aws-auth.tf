locals {
  eks_master_roles = [for role, arn in var.eks_master_role_arns : {
    rolearn  = arn,
    username = role,
    groups   = ["system:masters"]
  }]
  eks_node_roles = [for arn in var.eks_node_role_arns : {
    rolearn  = arn,
    username = "system:node:{{EC2PrivateDNSName}}",
    groups   = ["system:bootstrappers", "system:nodes"]
  }]
  map_roles = concat(local.eks_master_roles, local.eks_node_roles)
}

resource "kubernetes_config_map" "aws_auth" {
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
