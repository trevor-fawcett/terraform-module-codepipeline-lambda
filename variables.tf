variable "aws_region" {
  description = "The AWS region to deploy CodeBuild into (default: eu-west-2)."
  default     = "eu-west-2"
}

variable "organisation" {
  description = "The organisation is used as a prefix for S3 Buckets, names of which must be globally unique, where artifacts are stored (default: awip)"
  default = "awip"
}

variable "repo_name" {
  description = "The name of the CodeCommit repository (required)."
  default     = ""
}

variable "repo_branch" {
  description = "The branch of the repository to be processed by the pipeline (default: master)"
  default = "master"
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

variable "buildspec_test_file" {
  description = "The build spec file for the testing (default: buildspec_test.yml)"
  default = "buildspec_test.yml"
}

variable "buildspec_package_file" {
  description = "The build spec file for the build and package (default: buildspec_package.yml)"
  default = "buildspec_package.yml"
}

variable "buildspec_deploy_file" {
  description = "The build spec file for the deploy (default: buildspec_deploy.yml)"
  default = "buildspec_deploy.yml"
}