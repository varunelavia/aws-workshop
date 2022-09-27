provider "aws" {
  alias      = "us"
  region     = "us-west-2"
  access_key = var.student_access_key
  secret_key = var.student_secret_key
}

provider "aws" {
  alias      = "ap"
  region     = "ap-northeast-1"
  access_key = var.student_access_key
  secret_key = var.student_secret_key
}

provider "aws" {
  alias      = "eu"
  region     = "eu-west-1"
  access_key = var.student_access_key
  secret_key = var.student_secret_key
}

provider "aws" {
  alias      = "host_account"
  region     = "us-east-1"
  access_key = var.host_access_key
  secret_key = var.host_secret_key
}