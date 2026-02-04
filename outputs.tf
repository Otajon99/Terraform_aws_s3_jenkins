output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.bucket
}

output "website_endpoint" {
  description = "S3 static website URL"
  value       = aws_s3_bucket_website_configuration.hosting.website_endpoint
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.website.arn
}
