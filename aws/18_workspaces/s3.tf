resource "random_id" "bucket_id" {
  byte_length = 4
}
/*
dev workspace: 1 bucket
staging workspace: 2 buckets
prod workspace: 3 buckets   
*/
resource "aws_s3_bucket" "bucket" {
  count  = var.bucket_count
  bucket = "${terraform.workspace}-${count.index}-terraform-workspaces-${random_id.bucket_id.hex}"
  tags = {
    environment = "${terraform.workspace}"
  }
}