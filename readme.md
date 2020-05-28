# Terraform Module for AWS CodePipeline

This module produces a CodePipeline with two CodeBuild stages for test and build of source in a specified CodeCommit repository.
The packaged assets are then deployed, using CodeDeploy, to Lambda.