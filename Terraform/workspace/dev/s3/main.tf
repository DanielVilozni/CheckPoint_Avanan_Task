module "s3" {
  source            = "../../../../modules/s3"
  bucket_name       = "my-app-bucket"
  enable_versioning = true
}

