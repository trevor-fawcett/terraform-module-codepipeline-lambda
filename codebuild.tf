module "codebuild_project_test" {
  source = "./codebuild_module"
  aws_region = var.aws_region
  repo_name = var.repo_name
  codepipeline_stage = "test"
  build_artifact_bucket_arn = aws_s3_bucket.build_artifact_bucket.arn
  artifact_encryption_key_arn = aws_kms_key.artifact_encryption_key.arn
  build_timeout = var.build_timeout
  build_compute_type = var.build_compute_type
  build_image = var.build_image
  build_privileged_override = var.build_privileged_override
  buildspec_file = var.buildspec_test_file
}

module "codebuild_project_package" {
  source = "./codebuild_module"
  aws_region = var.aws_region
  repo_name = var.repo_name
  codepipeline_stage = "package"
  build_artifact_bucket_arn = aws_s3_bucket.build_artifact_bucket.arn
  artifact_encryption_key_arn = aws_kms_key.artifact_encryption_key.arn
  build_timeout = var.build_timeout
  build_compute_type = var.build_compute_type
  build_image = var.build_image
  build_privileged_override = var.build_privileged_override
  buildspec_file = var.buildspec_package_file
}

module "codebuild_project_deploy" {
  source = "./codebuild_module"
  aws_region = var.aws_region
  repo_name = var.repo_name
  codepipeline_stage = "deploy"
  build_artifact_bucket_arn = aws_s3_bucket.build_artifact_bucket.arn
  artifact_encryption_key_arn = aws_kms_key.artifact_encryption_key.arn
  build_timeout = var.build_timeout
  build_compute_type = var.build_compute_type
  build_image = var.build_image
  build_privileged_override = var.build_privileged_override
  buildspec_file = var.buildspec_deploy_file
}