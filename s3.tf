resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "${var.s3_bucket_name}"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}


