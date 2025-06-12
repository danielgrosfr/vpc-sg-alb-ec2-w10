terraform {
  backend "s3" {
    bucket  = "repace here with your bucket name"
    key     = "alb/terraform.state"
    region  = "us-east-1"
    encrypt = true
  }
}