data "template_file" "codepipeline_assume_role_policy_template" {
  template = file("${path.module}/policies/codepipeline_assume_role.tpl")
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "${var.repo_name}-codepipeline-role"
  assume_role_policy = data.template_file.codepipeline_assume_role_policy_template.rendered
}

data "template_file" "codepipeline_policy_template" {
  template = file("${path.module}/policies/codepipeline.tpl")
  vars = {
    aws_kms_key     = aws_kms_key.artifact_encryption_key.arn
    artifact_bucket = aws_s3_bucket.build_artifact_bucket.arn
  }
}

resource "aws_iam_role_policy" "attach_codepipeline_policy" {
  name   = "${var.repo_name}-codepipeline-policy"
  role   = aws_iam_role.codepipeline_role.id
  policy = data.template_file.codepipeline_policy_template.rendered
}

resource "aws_codepipeline" "codepipeline" {
  name     = var.repo_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.build_artifact_bucket.bucket
    type     = "S3"

    encryption_key {
      id   = aws_kms_key.artifact_encryption_key.arn
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        RepositoryName = var.repo_name
        BranchName     = var.repo_branch
      }
    }
  }

  stage {
    name = "Test"

    action {
      name             = "Test"
      category         = "Test"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source"]
      output_artifacts = ["tested"]
      version          = "1"

      configuration = {
        ProjectName = module.codebuild_project_test.codebuild_project_name
      }
    }
  }

  stage {
    name = "Package"

    action {
      name             = "Package"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["tested"]
      output_artifacts = ["packaged"]
      version          = "1"

      configuration = {
        ProjectName = module.codebuild_project_build.codebuild_project_name
      }
    }
  }
}