provider "aws" {
    region = "us-west-1"
  
}



resource "aws_instance" "name" {
    ami ="ami-061ad72bc140532fd"
    instance_type = "t2.micro"
    

  
}