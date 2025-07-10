terraform {
  backend "s3" {
    bucket = "myterraformbucket1223344444"
    key    = "terraform.tfstate"
    region = "us-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
