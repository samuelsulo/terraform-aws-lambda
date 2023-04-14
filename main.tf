resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  description      = var.description
  filename         = data.archive_file.this.output_path
  role             = aws_iam_role.this.arn
  source_code_hash = data.archive_file.this.output_base64sha256
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout

  environment {
    variables = var.variables
  }

  tags = merge({ Name = var.function_name }, var.tags)
}
