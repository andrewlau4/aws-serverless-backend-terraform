data "aws_iam_policy_document" "cognito_authenticated_policy_doc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.identity_pool.id]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values   = ["authenticated"]
    }
  }
}

resource "aws_iam_role" "cognito_authenticated_role" {
  name               = "${var.user_pool_name}_cognito_authenticated"
  assume_role_policy = data.aws_iam_policy_document.cognito_authenticated_policy_doc.json
}

data "aws_iam_policy_document" "combined_authenticated_policy_doc" {
  source_policy_documents = [
    templatefile("${path.module}/policies/s3_auth_policy.tftpl", { bucket_arn = var.s3_bucket_arn }),
    templatefile("${path.module}/policies/predictions_auth_policy.tftpl", {})
  ]
}

resource "aws_iam_role_policy" "cognito_authenticated_role_policy" {
  name   = "cognito_authenticated_role_policy"
  role   = aws_iam_role.cognito_authenticated_role.id

  policy = data.aws_iam_policy_document.combined_authenticated_policy_doc.json
}


resource "aws_cognito_identity_pool_roles_attachment" "identity_pool_roles_attachment" {
    identity_pool_id = aws_cognito_identity_pool.identity_pool.id

    roles = {
      "authenticated" = aws_iam_role.cognito_authenticated_role.arn
    }
}