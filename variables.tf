# Lambda function variables
variable "function_name" {
  description = "Name of the function."
  type        = string
}

variable "description" {
  description = "Description of what your Lambda Function does."
  type        = string
  default     = null
}

variable "root_dir" {
  description = "Path to the root directory of the function."
  type        = string
}

variable "handler" {
  description = "Function entrypoint in your code."
  type        = string
}

variable "runtime" {
  description = "Identifier of the function's runtime."
  type        = string
}

variable "timeout" {
  description = "Amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 3
}

variable "variables" {
  description = "Map of environment variables that are accessible from the function code during execution. If provided at least one key must be present."
  type        = map(string)
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the function."
  type        = map(string)
  default     = {}
}

# Lambda function builder variables
variable "build_command" {
  description = "Command to build the function."
  type        = string
}

variable "files_to_watch" {
  description = "List of files to watch for changes. Make sure the files you specify are inside of `root_dir`. If you omit this field or provide an empty list, the function will be built everytime."
  type        = list(string)
  default     = []
}

# Lambda function monitoring variables
variable "cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = null
}

# Lambda function IAM role variables
variable "role_name" {
  description = "Name of the Role assigned to the function. If no value is provided, `function_name` will be used."
  type        = string
  default     = ""
}

variable "inline_policies" {
  description = "Inline policies to attach to the IAM role for the Lambda function."
  type = list(object({
    name   = string
    policy = string
  }))
  default = []
}
