terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        "Name" = "${var.env_prefix}-vpc"
    }
}

module "myapp-subnet" {
  source = "./modules/subnet"
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone = var.avail_zone
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.myapp-vpc.id
}

module "myapp-server" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id
  my_ip = var.my_ip
  public_ssh_key_location = var.public_ssh_key_location
  avail_zone = var.public_ssh_key_location
  instance_type = var.instance_type
  subnet_id = module.myapp-subnet.subnet.id
  env_prefix = var.env_prefix
}
