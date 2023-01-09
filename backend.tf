terraform {
backend "s3" {
    bucket = "bknd-jp"
    key = "dev"
    region = "us-east-1"
}
}