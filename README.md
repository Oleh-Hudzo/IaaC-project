# Terraform Infrastructure for AWS

This repository contains Terraform code that creates a VPC, subnet, internet gateway, route table, security group, and an EC2 instance with a running web server in an Amazon Web Services (AWS) account.

## Prerequisites

- AWS account with appropriate permissions to create resources.
- Terraform installed on your local machine.
- ssh key pair (generated using ssh-keygen) that will be used to access the EC2 instance.

## Getting Started

1. Clone the repository:
```
$ git clone https://github.com/Oleh-Hudzo/terraform_ec2.git
```
2. Change directory to the cloned repository:
```
$ cd terraform-aws-infrastructure
```
3. Create a file named terraform.tfvars in the root directory of the cloned repository, and populate it with the following variables:
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
4. Run `terraform init` to initialize the Terraform environment and download the necessary provider plugins:
```
$ terraform init
```
5. Run `terraform plan` to see the changes that will be made to your AWS account:
```
$ terraform plan
```
6. Run `terraform apply` to create the resources:
```
$ terraform apply
```


After the resources have been created, you can access the web server by using the public IP of the EC2 instance on port 8080.

## File Structure

The root directory contains the main Terraform file, which calls the modules in the modules directory. The modules directory contains the following subdirectories:
- vpc: contains the Terraform code for creating the VPC, internet gateway, and route table.
- subnet: contains the Terraform code for creating the subnet.
- webserver: contains the Terraform code for creating the security group, EC2 instance, and running the web server.

Each subdirectory contains the following files:
- main.tf: contains the Terraform resources for creating the respective resources.
- variables.tf: contains the input variables for the resources.
- output.tf: contains the output variables for the resources.

You can customize the resources by modifying the variables in the terraform.tfvars file and re-running `terraform apply`.

To delete the resources, run `terraform destroy`.

After the resources have been created, you can access the web server by using the public IP of the EC2 instance on port 8080.

The entry-script.sh file, located in the "webserver" subdirectory, is used to install and run the web server. This script can be modified to install different applications, but it is important to note that Terraform is not designed to be used as a provisioning tool. For more advanced provisioning tasks, it is recommended to use other tools such as Ansible, Chef, or Puppet. These tools are more powerful and flexible than Terraform and allow for more complex provisioning scenarios.

**Note:** This is a sample Terraform configuration and it is intended for learning and testing purposes only. It is not production-ready and should not be used in a production environment.