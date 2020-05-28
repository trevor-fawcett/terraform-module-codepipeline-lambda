resource "aws_s3_bucket" "build_artifact_bucket" {
  bucket        = "${var.organisation}-${var.repo_name}-build-artifact-bucket"
  acl           = "private"
  force_destroy = "true"
}