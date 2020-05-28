variable "aws_region" {
  description = "The AWS region to deploy CodeBuild into (default: eu-west-2)."
  default     = "eu-west-2"
}

variable "repo_name" {
  description = "The name of the CodeCommit repository."
  default     = ""
}

variable "codepipeline_stage" {
  description = "The purpose of this CodeBuild project (e.g. test)"
  default = ""
}

variable "build_artifact_bucket_arn" {
  description = "The ARN for the S3 Bucket that receives the CodeBuild artifacts"
  default     = ""
}

variable "artifact_encryption_key_arn" {
  description = "The ARN for the KMS key used to encrypt the artifacts"
  default = ""
}

variable "build_timeout" {
  description = "The build timeout (default: 5)"
  default = "5"
}

variable "build_compute_type" {
  description = "The build image compute type (default: BUILD_GENERAL1_SMALL)"
  default = "BUILD_GENERAL1_SMALL"
}

variable "build_image" {
  description = "The build image (default: aws/codebuild/standard:2.0)"
  default = "aws/codebuild/standard:2.0"
}

variable "build_privileged_override" {
  description = "The build environment privilege override (default: false)"
  default = "false"
}

variable "buildspec_file" {
  description = "The build spec file name for this project (default: buildspec.yml)"
  default = "buildspec.yml"
}