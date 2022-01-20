resource "aws_s3_bucket" "app_bucket" {
  bucket = join("-", [var.name, "assets"])
  acl    = "private"
}
