variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "ap-southeast-2"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "lambda"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store Lambda code"
  type        = string
  default     = "simo-test-bucket-57334"
}

