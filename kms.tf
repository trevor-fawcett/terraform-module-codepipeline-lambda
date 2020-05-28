resource "aws_kms_key" "artifact_encryption_key" {
  description             = "${var.organisation}-${var.repo_name}-artifact-encryption-key"
  deletion_window_in_days = 10
}