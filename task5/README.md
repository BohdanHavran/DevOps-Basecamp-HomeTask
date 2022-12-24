# Ansible

In this task, I used Terraform to deploy the infrastructure and Ansible to configure it. Using Terraform, I created an inventory file and group_vars, these files are used to connect Ansible to remote virtual machines. After Terraform deploys the infrastructure, it runs Ansible, which already configures the servers. For correct operation when starting Terraform, enter your username from linux in the variable ssh_username. Instructions are described below. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform) or [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed

<h3>Note</h3>
Tested on:

- Ubuntu 20.04.3 LTS
- Terraform v1.3.6
- Ansible Version: 6.7.0

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task5
```
In order to run this project, you need to enter the following commands:
```
terraform init
```
```
terraform apply -var ssh_username="Your linux username"
```
If you need to remove a project:
```
terraform destroy
```
![image](https://user-images.githubusercontent.com/7732624/209435856-087aa6ca-e1a5-4b41-970d-8474548659a4.png)
