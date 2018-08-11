#Using a proper backend instead of TerraGrunt as noted in chapter 3
terraform {
  backend "s3" {
    bucket = "cliffwheadon-terraform-up-and-running-state"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  db_name = "mysql_stage"
  db_password = "${var.db_password}"
}