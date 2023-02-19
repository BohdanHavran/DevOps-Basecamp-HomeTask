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
### Hardening
![image](https://user-images.githubusercontent.com/7732624/219907025-1451b639-1235-4254-8859-18c2dc9c0937.png)

![image](https://user-images.githubusercontent.com/7732624/219907509-c296e77c-0847-4e91-b87c-3e5c0b3a9d2e.png)


### Deploy K8s
![image](https://user-images.githubusercontent.com/7732624/219907099-bf6675c3-2a14-4694-bdf5-687de5c9a455.png)

### Deploy Wordpress
![image](https://user-images.githubusercontent.com/7732624/219907125-9a7860c3-4593-45f7-982f-11b7bdf5b0ca.png)

### Result
![image](https://user-images.githubusercontent.com/7732624/219907142-5fa238c9-6429-47de-ba45-66c43f2e8b31.png)

![image](https://user-images.githubusercontent.com/7732624/219907227-f66d5a1f-57bf-4b54-9d3e-04b584e32d00.png)

![image](https://user-images.githubusercontent.com/7732624/219907239-4afa107c-9425-45ec-bda0-c82b13326960.png)

![image](https://user-images.githubusercontent.com/7732624/219907291-96d672df-e4aa-4ef3-b128-fa786d8ddff9.png)

![image](https://user-images.githubusercontent.com/7732624/219907311-7930d5e9-a95b-40ba-bc9f-2803bd00f765.png)

![image](https://user-images.githubusercontent.com/7732624/219907330-6ed18be4-1ea5-4787-bf1e-54d0b5aa2a08.png)

