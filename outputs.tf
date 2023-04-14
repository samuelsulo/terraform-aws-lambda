output "function_name" {
  description = "Name of the function."
  value       = aws_lambda_function.this.function_name
}

output "arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = aws_lambda_function.this.arn
}

output "invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.this.invoke_arn
}

output "qualified_arn" {
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
  value       = aws_lambda_function.this.qualified_arn
}

output "qualified_invoke_arn" {
  description = "Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.this.qualified_invoke_arn
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value       = aws_lambda_function.this.version
}
