provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-035cecbff25e0d91e"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

