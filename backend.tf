terraform {
  backend "s3" {
    bucket = "s3-big-bucket-04"
    key = "terraform.tfstate"
    region = "ap-south-1"
    }
}