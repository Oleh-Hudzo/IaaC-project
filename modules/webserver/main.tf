resource "aws_security_group" "myapp-sg" {
    name = "myapp-sg"
    vpc_id = var.vpc_id
    tags = {
      "Name" = "${var.env_prefix}-sg"
    }
}
resource "aws_security_group_rule" "ingress-ssh" {
    security_group_id = aws_security_group.myapp-sg.id
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ var.my_ip ]   
}
resource "aws_security_group_rule" "ingress-http" {
    security_group_id = aws_security_group.myapp-sg.id
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "egress-all-traffic" {
    security_group_id = aws_security_group.myapp-sg.id
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

data "aws_ami" "latest-amazon-linux-image" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "server-key"
    public_key = file(var.public_ssh_key_location)
}

resource "aws_instance" "myapp-server" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.myapp-sg.id]
    
    associate_public_ip_address = true
    key_name = aws_key_pair.ssh-key.key_name

    user_data = file("./modules/webserver/entry-script.sh")
    
    tags = {
      "Name" = "${var.env_prefix}-server"
    }
}
