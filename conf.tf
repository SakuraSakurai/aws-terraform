terraform {
  required_version = "~> 0.10.5"
  backend "s3" {
    region = "ap-northeast-1"
    # this "key" has no effect because of using state environments
    key = "terraform"
  }
}

provider "aws" {
  region = "ap-northeast-1"
  #access_key = "anaccesskey"
  #secret_key = "asecretkey"
  /*assume_role {
    #role_arn = "${data.aws_iam_role.sys-ec2role_ci-blt.id}"
    #session_name = "SESSION_NAME"
    #external_id  = "EXTERNAL_ID"
  }*/
}