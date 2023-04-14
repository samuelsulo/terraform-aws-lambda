locals {
  role_name = var.role_name != "" ? var.role_name : var.function_name
}

resource "aws_iam_role" "this" {
  name               = local.role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

  tags = {
    Name = local.role_name
  }
}

resource "aws_iam_role_policy_attachment" "basic_execution" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "this" {
  count = length(var.inline_policies)

  name   = var.inline_policies[count.index].name
  policy = var.inline_policies[count.index].policy
  role   = aws_iam_role.this.id
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    effect = "Allow"
  }
}
