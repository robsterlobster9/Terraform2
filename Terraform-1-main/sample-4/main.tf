terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

# data "aws_ami" "app_server" {
#   filter {
#     name = "image-id"
#     values = ["ami-830c94e3"]
#   }

#   owners = ["099720109477"] # Canonical
# }

resource "aws_instance" "app_server" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = var.type
  tags = {
    Name = "ExampleAppServerInstance-Uri"
  }
  
#   lifecycle {
#     # The AMI ID must refer to an AMI that contains an operating system
#     # for the `x86_64` architecture.
#     precondition {
#       condition     = data.aws_ami.app_server.architecture == "x86_64"
#       error_message = "The selected AMI must be for the x86_64 architecture."
#     }
#   }
}
