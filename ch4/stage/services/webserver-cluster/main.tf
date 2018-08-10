data "terraform_remote_state" "db" {
  backend = "s3"

  config {
    bucket = "cliffwheadon-terraform-up-and-running-state"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-stage"
  db_remote_state_bucket = "cliffwheadon-terraform-up-and-running-state"
  db_remote_state_key = "stage/services/webserver-cluster/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
}
