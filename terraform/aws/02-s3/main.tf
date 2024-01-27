resource "aws_s3_object" "graph-pic" {
  bucket     = aws_s3_bucket.em-test-bucket.bucket
  key        = "graph.png"
  source     = "graph.png"
  depends_on = [
    aws_s3_bucket.em-test-bucket
  ]
  etag = filemd5("graph.png")
}

resource "aws_s3_bucket" "em-test-bucket" {
  bucket = "em-test-bucket-501"
  tags   = {
    Description = "Em-test Terraform"
  }
}