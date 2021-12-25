terraform {
  backend "s3" {
    bucket = "tfstatedoron"
    key    = "tfstatehw3"
    region = "us-east-1"
  }
}
