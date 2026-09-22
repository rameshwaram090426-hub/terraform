output "random_id" {
  value = random_id.bucket_suffix.hex
}
output "s3_bucket_name" {
  value = aws_s3_bucket.this.bucket
}
output "instance_id" {
  value = aws_instance.this.id
}