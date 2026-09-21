resource "aws_s3_bucket" "my_tainted_bucket" {
  bucket = "474265880032-tf-bucket"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}