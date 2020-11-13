provider "aws" {
  version = "3.11.0"
}

terraform {
  backend "s3" {
    key     = "ecs-demo-dashboard.tfstate"
    encrypt = true
  }
}

data "terraform_remote_state" "rds" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    key    = "ecs-demo-rds.tfstate"
    bucket = var.state_bucket
  }
}

data "terraform_remote_state" "ecs" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    key    = "ecs-demo-ecs.tfstate"
    bucket = var.state_bucket
  }
}
