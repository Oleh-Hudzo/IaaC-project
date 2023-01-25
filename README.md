# terraform_ec2
<h1>Creates ec2 with nginx docker container on latest amazon linux 2 ami, custom vpc and subnet</h1>

***Change your environment variables in terraform.tfvars before running program***

The program creates a VPC, subnet, Route table, Internet gateway and Security groups with ingress rules for ssh login from the owner's IP address and 8080 port is also open for all traffic via the tcp protocol (for nginx).
Immediately after launching, the entry-script.sh is launched, which installs nginx in the docker container. (The script can be changed to install another app)
