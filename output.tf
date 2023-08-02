output "user_pool_id" {
  value = module.create_cognito_infrastructure.user_pool_id
}

output "user_pool_web_client_id" {
  value = module.create_cognito_infrastructure.user_pool_client_id
}

output "identity_pool_id" {
  value = module.create_cognito_infrastructure.identity_pool_id
}


output "identity_pool_region" {
   value = module.create_cognito_infrastructure.client_pool_region  
}

output "s3_bucket_name" {
  value = module.create_s3_infrastructure.s3_bucket_name
}

output "current_aws_region" {
    value = data.aws_region.current_region.name
}