provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = "ap-southeast-2"
  profile = "simple_sinatra_app"
}

# Create the IAM role
resource "aws_iam_role" "simple-sinatra-app" {
  name = "simple-sinatra-app"
  assume_role_policy = ""
}

# Declare the IAM credentials being used
data "aws_iam_role" "ecr" {
  name = "ecr"
}

# Create ECR repository named "simple-sinatra-app"
module "ecr-repository" {
  source              = "git::https://github.com/cloudposse/terraform-aws-ecr.git?ref=master"
  name                = "simple-sinatra-app"
  namespace           = "simple-sinatra-app"
  stage               = "prod"
  roles               = ["${data.aws_iam_role.ecr.name}"]
}

