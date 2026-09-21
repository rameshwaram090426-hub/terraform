# import {
#   to = aws_lambda_function.terraformLambda
#   id = "manuallyCreated"
# }

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file  = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda.zip"
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_lambda_function" "terraformLambda" {
  architectures                        = ["x86_64"]
  code_sha256                          = "R6fL2f5y9xHPTo4NojRtY2hz04DlAxWgwXm4xSMnwRQ="
  filename                             = "${path.module}/lambda.zip"
  function_name                        = "manuallyCreated"
  handler                              = "lambda_function.lambda_handler"
  region                               = "ap-south-1"
  reserved_concurrent_executions       = -1
  role                                 = "arn:aws:iam::474265880032:role/service-role/manuallyCreated-role-ds7810xh"
  runtime                              = "python3.14"
  timeout                              = 3
  use_resource_timeout_for_propagation = null
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/manuallyCreated"
  }
  tracing_config {
    mode = "PassThrough"
  }
}
