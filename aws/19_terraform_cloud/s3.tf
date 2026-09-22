resource "aws_s3_bucket" "this" {
  bucket = "terraform-cloud-${random_id.bucket_suffix.hex}"
  tags = {
    Name      = "terraform-cli-${random_id.bucket_suffix.hex}"
    CreatedBy = "Terraform-Cloud"
  }
}