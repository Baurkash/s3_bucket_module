resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
   }

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

}











# resource "aws_s3_bucket" "bucket" {
#   bucket        = var.bucket_name
#   force_destroy = true

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
  

# }
# resource "aws_s3_bucket_versioning" "bucket" {
#   bucket = aws_s3_bucket.bucket.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }
# resource "aws_s3_bucket_acl" "bucket" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "private"
# }
# resource "aws_s3_bucket_lifecycle_configuration" "bucket" {
#   bucket = aws_s3_bucket.bucket.id

#   rule {
#     id = "rule-1"
#     status = "Enabled"
#   }
#   transition {
#       days          = 30
#       storage_class = "STANDARD_IA" # or "ONEZONE_IA"
#     }

#     transition {
#       days          = 60
#       storage_class = "GLACIER"
#     }
# }