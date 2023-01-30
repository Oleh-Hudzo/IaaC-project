# Infrustructure as a Code Project

This repository contains Terraform code that creates a VPC, subnet, internet gateway, route table, security group, and an EC2 instance with a running web server in an Amazon Web Services (AWS) account. Additionally, an Ansible provisioning feature has been added to upload the node packaged file as a Docker container to the server. The Terraform script creates the server, and all that is needed is to copy the node app packaged with its Dockerfile to the ansible/files folder and adjust the settings in the terraform.tfvars file.

## Prerequisites

- AWS account with appropriate permissions to create resources.
- Terraform installed on your local machine.
- Ansible installed on your local machine.
- Node.js packaged app to run on server with Dockerfile inside
- ssh key pair (generated using ssh-keygen) that will be used to access the EC2 instance.

## Getting Started

1. Clone the repository:
```
$ git clone https://github.com/Oleh-Hudzo/IaaC-project.git
```
2. Change directory to the cloned repository:
```
$ cd IaaC-project
```
3. Change variables in a file named terraform.tfvars in the Terraform directory of the cloned repository, and populate it with the following variables:
```
region = "your-region"
vpc_cidr_block = "your-vpc-cidr-block"
subnet_cidr_block = "your-subnet-cidr-block"
env_prefix = "your-environment-prefix"
my_ip = "your-ip-address/32"
instance_type = "your-instance-type"
public_ssh_key_location = "path-to-your-public-ssh-key"
avail_zone = "your-availability-zone"
```
4. Copy your packaged node app archive (app-archive.tgz) to the ansible/playbooks/files directory.
5. Run `terraform init` to initialize the Terraform environment and download the necessary provider plugins:
```
$ terraform init
```
6. Run `terraform plan` to see the changes that will be made to your AWS account:
```
$ terraform plan
```
7. Run `terraform apply` to create the resources:
```
$ terraform apply
```
8. Run `terraform destroy` to delete the resources:
```
$ terraform destroy
```

After the resources have been created, you can access your Node.js app by using the public IP of the EC2 instance on port 8080. The script runs a portfolio website by default, if no changes are made.


Ansible is used in conjunction with Terraform because it provides more advanced provisioning capabilities compared to Terraform. Terraform is great for provisioning infrastructure, but it is limited in its ability to install, configure, and manage applications. Ansible, on the other hand, is a powerful configuration management tool that can automate complex application deployments, software updates, and other tasks. The use of Ansible allows for more advanced provisioning scenarios, and it provides more flexibility and control over the application environment.

**Note:** This is a sample Terraform+Ansible configuration and it is intended for learning and testing purposes only. It is not production-ready and should not be used in a production environment.