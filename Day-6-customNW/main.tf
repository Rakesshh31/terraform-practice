#vpc creation
resource "aws_vpc" "name" {

    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "tvpc"
    }
  
}
#subnet creation
resource "aws_subnet" "name" {

    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-1a"

    tags = {
        Name = "tsubnet"
    }  
}
#IG

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id

    tags ={

        Name = "tig"
    }
    

  
}
#Route table

resource "aws_route_table" "name" {

    vpc_id = aws_vpc.name.id
    route  {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
  
}
#editroutes

resource "aws_route_table_association" "name" {

    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
  
}
#subnet association
resource "aws_security_group" "name" {
    name = "tsg"
    vpc_id = aws_vpc.name.id
    tags = {
      Name ="dev_sg"

    }
ingress {
    description = "TLS from VPC"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    description = "TLS from VPC"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
}

ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
}
}

  
resource "aws_instance" "name" {
    ami = "ami-061ad72bc140532fd"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.name.id]

  
}
#SG group
#nat
#ec2 creation
