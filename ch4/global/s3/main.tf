#Using a proper backend instead of TerraGrunt as noted in chapter 3
terraform {
  backend "s3" {
    bucket = "cliffwheadon-terraform-up-and-running-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
}