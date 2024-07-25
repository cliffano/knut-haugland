terraform {
  backend "s3" {
    bucket = "knuthauglandexamplebucket"
    key    = "kon-tiki/knuthauglandexample.tfstate"
    region = "ap-southeast-2"
  }
}
