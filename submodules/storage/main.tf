data "aws_canonical_user_id" "current" {}
data "aws_elb_service_account" "this" {}
data "aws_partition" "current" {}

locals {
  s3_buckets = {
    backups = {
      bucket_name = aws_s3_bucket.backups.bucket
      id          = aws_s3_bucket.backups.id
      policy_json = data.aws_iam_policy_document.backups.json
      arn         = aws_s3_bucket.backups.arn
    }
    blobs = {
      bucket_name = aws_s3_bucket.blobs.bucket
      id          = aws_s3_bucket.blobs.id
      policy_json = data.aws_iam_policy_document.blobs.json
      arn         = aws_s3_bucket.blobs.arn
    }
    logs = {
      bucket_name = aws_s3_bucket.logs.bucket
      id          = aws_s3_bucket.logs.id
      policy_json = data.aws_iam_policy_document.logs.json
      arn         = aws_s3_bucket.logs.arn
    }
    monitoring = {
      bucket_name = aws_s3_bucket.monitoring.bucket
      id          = aws_s3_bucket.monitoring.id
      policy_json = data.aws_iam_policy_document.monitoring.json
      arn         = aws_s3_bucket.monitoring.arn
    }
    registry = {
      bucket_name = aws_s3_bucket.registry.bucket
      id          = aws_s3_bucket.registry.id
      policy_json = data.aws_iam_policy_document.registry.json
      arn         = aws_s3_bucket.registry.arn
    }
  }
}
