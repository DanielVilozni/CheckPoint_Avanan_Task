resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl = "private"

  # Enable versioning if set to true
  versioning {
    enabled = true
  }
}

