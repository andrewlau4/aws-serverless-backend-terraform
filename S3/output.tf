output "s3_bucket_arn" {
   value = aws_s3_bucket.fullstack_app_s3_bucket.arn  
}

output "s3_bucket_name" {
   value = aws_s3_bucket.fullstack_app_s3_bucket.bucket
}