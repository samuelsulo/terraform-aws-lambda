locals {
  log_group_name = "/aws/lambda/${var.function_name}"
}

resource "aws_cloudwatch_log_group" "this" {
  name              = local.log_group_name
  retention_in_days = var.cloudwatch_log_group_retention_in_days

  tags = {
    Name = local.log_group_name
  }
}
