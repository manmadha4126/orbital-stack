terraform {
  backend "s3" {
    bucket         = "vertex-tf-state"
    key            = "orbital/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock"
  }
}