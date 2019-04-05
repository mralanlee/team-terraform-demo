variable "bucket_name" {
  type        = "string"
  description = "name for your buckets"
}

variable "acl" {
  type        = "string"
  description = "access control list"
  default     = "private"
}

variable "index_document" {
  type        = "string"
  description = "your index file for the website"
  default     = "index.html"
}

variable "index_document_path" {
  type = "string"
}

variable "error_document_path" {
  type = "string"
}

variable "error_document" {
  type        = "string"
  description = "your 404's or error page"
  default     = "error.html"
}

resource "aws_s3_bucket" "mobuckets" {
  // instead of vars you can actually put string values
  bucket = "${var.bucket_name}" // "alanlee-bucket-demo-tf-lol"
  acl    = "${var.acl}"         // "public-read"

  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "${var.index_document}" // index.html
    error_document = "${var.error_document}" // error.html
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = "${aws_s3_bucket.mobuckets.bucket}"
  key    = "${var.index_document}"
  source = "${var.index_document_path}"

  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket = "${aws_s3_bucket.mobuckets.bucket}"
  key    = "${var.error_document}"
  source = "${var.error_document_path}"

  content_type = "text/html"
}

output "website" {
  value = "${aws_s3_bucket.mobuckets.website_endpoint}"
}
