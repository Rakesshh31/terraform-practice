
provider "aws" {
  
}



resource "aws_instance" "name" {
    ami ="ami-061ad72bc140532fd"
    instance_type = "t2.micro"
    region = "us-west-1"

    tags = {
        Name = "day-5"
    } 
}



