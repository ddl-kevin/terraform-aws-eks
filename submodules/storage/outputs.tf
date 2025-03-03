output "efs_access_point" {
  description = "efs access point"
  value       = aws_efs_access_point.eks
}

output "efs_file_system" {
  description = "efs file system"
  value       = aws_efs_file_system.eks
}

output "s3_buckets" {
  description = "S3 buckets name and arn"
  value = { for k, b in local.s3_buckets : k => {
    "bucket_name" = b.bucket_name,
    "arn"         = b.arn
  } }
}

output "s3_policy" {
  description = "s3 IAM Policy arn"
  value       = aws_iam_policy.s3.arn
}

output "efs_security_group" {
  description = "EFS security group id"
  value       = aws_security_group.efs.id
}
