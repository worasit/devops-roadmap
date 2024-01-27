output "bucket-dns" {
  value = aws_s3_bucket.em-test-bucket.bucket_domain_name
}