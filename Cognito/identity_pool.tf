locals {
    //the arn looks like:  arn:aws:cognito-idp:us-east-1:...
    client_pool_region = split(":", aws_cognito_user_pool.userpool.arn)[3]
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = "${var.user_pool_name}_identity_pool"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.user_pool_client.id
    provider_name           = "cognito-idp.${local.client_pool_region}.amazonaws.com/${aws_cognito_user_pool.userpool.id}"
    server_side_token_check = false
  }
}

