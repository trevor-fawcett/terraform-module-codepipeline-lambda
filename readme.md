# Terraform Module for AWS CodePipeline

This module produces a CodePipeline with two CodeBuild stages for test and build of source in a specified CodeCommit repository.
The packaged assets are then deployed, using CodeDeploy, to Lambda.

## CodePipeline + CodeDeploy = Fail!

Turns out CodeDeploy for a Lambda is expecting an archive and despite my best efforts couldn't get this to work with CodePipeline.
I found [a Stack Overflow response](https://stackoverflow.com/questions/53136089/codepipeline-codedeploy-reports-bundletype-must-be-either-yaml-or-json) with a link to [an AWS forum article](https://forums.aws.amazon.com/thread.jspa?messageID=864336) referring to this issue. The Stack Overflow article suggests a CodeBuild stage to trigger CodeDeploy using AWS CLI.