terraform {
backend "s3" {
    bucket = "terraform-backend"
    key = "dev"
    region = "us-east-1"
}
}