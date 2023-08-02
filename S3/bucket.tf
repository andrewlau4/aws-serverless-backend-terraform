locals {
    bucket_name = join("", [replace(var.bucket_prefix_name, "_", "-"), "-fullstack-app-s3-bucket" ])
}

resource "aws_s3_bucket" "fullstack_app_s3_bucket" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "fullstack_app_s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.fullstack_app_s3_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_cors_configuration" "fullstack_app_s3_bucket_cors" {
  bucket = aws_s3_bucket.fullstack_app_s3_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = [ 
      "GET",
      "HEAD",
      "PUT",
      "POST",
      "DELETE" ]
    allowed_origins = ["*"]
    expose_headers  = [       
      "x-amz-server-side-encryption",
      "x-amz-request-id",
      "x-amz-id-2",
      "ETag" ]
    max_age_seconds = 3000
  }

}