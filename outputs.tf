output "ssh_bastion_command" {
  description = "Command to ssh into the bastion host"
  value       = var.bastion != null ? "ssh -i ${local.ssh_pvt_key_path} -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no ${local.bastion_user}@${module.bastion[0].public_ip}" : ""
}

output "bastion_ip" {
  description = "public ip of the bastion"
  value       = var.bastion != null ? module.bastion[0].public_ip : ""
}

output "hostname" {
  description = "Domino instance URL."
  value       = "${var.deploy_id}.${var.route53_hosted_zone_name}"
}

output "efs_access_point" {
  description = "EFS access point"
  value       = module.storage.efs_access_point
}

output "efs_file_system" {
  description = "EFS file system"
  value       = module.storage.efs_file_system
}

output "s3_buckets" {
  description = "S3 buckets"
  value       = module.storage.s3_buckets
}

output "domino_key_pair" {
  description = "Domino key pair"
  value       = aws_key_pair.domino
}

output "kubeconfig" {
  description = "location of kubeconfig"
  value       = local.kubeconfig_path
}
