provider "aws" {
  region = var.aws_region
}

resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "./scripts/git-lambda-build.sh"
  }
}





resource "aws_lambda_function" "lambda_function" {
  depends_on = [ null_resource.git_clone ]
  function_name = var.lambda_function_name
  handler       = "handler.handler"
  runtime       = "nodejs20.x"
  role          = aws_iam_role.lambda_role.arn
  filename      = "${path.module}/deploy/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/deploy/lambda.zip")
}






