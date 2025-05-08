resource "aws_s3_bucket" "naked_redirect" {
  bucket = "open-ews.org"
}

resource "aws_s3_bucket_website_configuration" "naked_redirect" {
  bucket = aws_s3_bucket.naked_redirect.id

  redirect_all_requests_to {
    host_name = "www.open-ews.org"
    protocol  = "https"
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "www.open-ews.org"
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource":[
        "${aws_s3_bucket.website.arn}/*"
      ]
    }
  ]
}
POLICY

  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]
}

