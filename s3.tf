resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
  acl    = "private"  # Fixes the public-read issue

  versioning {
    enabled = true  # Fixes versioning disabled issue
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"  # Fixes default encryption issue
      }
    }
  }
