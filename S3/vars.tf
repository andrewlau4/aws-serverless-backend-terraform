variable "bucket_prefix_name" {
    type = string
}

variable "lambda_inline_policy" {
  type = list(any)
  default = []
}