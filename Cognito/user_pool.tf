resource "aws_cognito_user_pool" "userpool" {
  name = var.user_pool_name

  alias_attributes = [ "email" ]
  auto_verified_attributes = ["email"]

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject = "Account Confirmation"
    email_message = "Your confirmation code is {####}"
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  lambda_config {
//    pre_authentication = 
//    pre_sign_up = 
//    pre_token_generation = 
  }

  schema {
        name = "subscription_level"
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        required                 = false
        string_attribute_constraints { 
            min_length = 0
            max_length = 50
        }
    }    
}


resource "aws_cognito_user_pool_client" "user_pool_client" {
  name = "${var.user_pool_name}_user_pool_client"

  user_pool_id = aws_cognito_user_pool.userpool.id
  generate_secret = false
  refresh_token_validity = 90
  prevent_user_existence_errors = "ENABLED"
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]

  callback_urls                        = ["https://example.com"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]
  supported_identity_providers         = ["COGNITO"]
}