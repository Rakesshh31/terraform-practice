provider "aws" {
region = "us-west-1"
}



resource "aws_instance" "name" {
    ami ="ami-032db79bb5052ca0f"
    instance_type = "t2.micro"
    tags = {
Name = "prod"

  
}
