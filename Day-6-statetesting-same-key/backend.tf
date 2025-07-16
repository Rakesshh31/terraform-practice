terraform {
  backend "s3" {
    bucket         = "myterraformbucket1223344444"
    key            = "day-1/terraform.tfstate"
    region         = "us-west-1"
    use_lockfile = true
    #dynamodb_table = "test"
    #encrypt        = true
  }
}
