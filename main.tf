provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
