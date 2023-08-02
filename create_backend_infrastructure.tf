module "create_s3_infrastructure" {
    source = "./S3"

    bucket_prefix_name = var.user_pool_name 
}


module "create_cognito_infrastructure" {
    source = "./Cognito"

    user_pool_name = var.user_pool_name 

    s3_bucket_arn = module.create_s3_infrastructure.s3_bucket_arn
}

data "aws_region" "current_region" {}