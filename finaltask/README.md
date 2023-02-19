# FinalTask
In this task, I used Terraform to deploy the infrastructure and Ansible to configure it, and Kubernetes was also involved. Using Terraform I created an inventory file, group_vars and some more config files, these files are used to connect Ansible to remote virtual machines. After Terraform deploys the infrastructure, it runs Ansible, which already configures the server. For correct operation when starting Terraform, enter your Linux username in the ssh_username variable and enter your domain name in the host variable, if you don't have one, you can use the free [dynv6](https://dynv6.com/) service to create it. The instructions are described below. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform), [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), or [Docker](https://docs.docker.com/engine/install/ubuntu/) installed, you need to install!

<h3>Note</h3>
Tested on:

- Ubuntu 20.04 LTS
- Terraform v1.3.6
- Ansible Version: 6.7.0

# How to start?
In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/finaltask
```
In order to run this project, you need to enter the following commands:
```
terraform init
```
```
terraform apply -var ssh_username="Your linux username" -var host="Your domain name" --auto-approve
```

