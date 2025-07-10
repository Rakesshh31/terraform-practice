resource "aws_instance" "name" {
    ami ="ami-061ad72bc140532fd"
    instance_type = "t2.micro"
    

  
}

resource "aws_vpc" "name" {

    cidr_block = "10.0.0.0/16"


  
}