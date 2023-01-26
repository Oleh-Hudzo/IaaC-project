resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
        "Name" = "${var.env_prefix}-subnet-1"
    }
}

resource "aws_route_table" "myapproute-table" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myapp-internet-gateway.id
    }
    tags = {
      "Name" = "${var.env_prefix}-rout-table"
    }
}

resource "aws_internet_gateway" "myapp-internet-gateway" {
    vpc_id = var.vpc_id
    tags = {
      "Name" = "${var.env_prefix}-internet-gateway"
    }
}

resource "aws_route_table_association" "a-rtb-subnet" {
    subnet_id = aws_subnet.myapp-subnet-1.id
    route_table_id = aws_route_table.myapproute-table.id
}