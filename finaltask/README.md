# <a name="finaltask">FinalTask</a>
In this task, I used Terraform to deploy the infrastructure and Ansible to configure it, and Kubernetes was also involved. Using Terraform I created an inventory file, group_vars and some more config files, these files are used to connect Ansible to remote virtual machines. After Terraform deploys the infrastructure, it runs Ansible, which already configures the server. For correct operation when starting Terraform, enter your Linux username in the ssh_username variable and enter your domain name in the host variable, if you don't have one, you can use the free [dynv6](https://dynv6.com/) service to create it. The instructions are described below. If you don't have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform), [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), or [Docker](https://docs.docker.com/engine/install/ubuntu/) installed, you need to install!
Elements that were used in this task:<br>
[Infrastructure in GCP](#infrastructure-in-gcp) | [Hardening](#hardening) | [Deploy K8s](#deploy-k8s) | [Deploy Wordpress](#deploy-wordpress) | [Result](#result)

<h3>Note</h3>
Before starting work with the project, you should check whether you have enabled such resources as sqladmin API, Cloud Resource Manager API and Service Networking API, if not, then you need to go to the GCP site and enable them there.
Before starting work with the project, you should check whether you have enabled such resources as sqladmin API, Cloud Resource Manager API and Service Networking API, if not, then you need to go to the GCP site and enable them there.<br>
<br>
<b>The project will be ready in +-40 minutes</b><br><br>

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
Now you just have to wait for all the processes to complete
### <a name="infrastructure-in-gcp">Infrastructure in GCP</a> [☝️](#finaltask)
The first thing Terraform does is create a VPC, Instance and managed DB (MySQL):<br>
![image](https://user-images.githubusercontent.com/7732624/219962170-c1a571cd-082c-4952-bdbf-fc69b2b12540.png)<br>
![image](https://user-images.githubusercontent.com/7732624/219962112-0ce1053b-97ba-4c9d-947e-f6bd69e3b158.png)<br>
![image](https://user-images.githubusercontent.com/7732624/219962139-6adb0100-9329-4ed1-b4e2-69f471f2ee27.png)


### <a name="hardening">Hardening</a> [☝️](#finaltask)
After the infrastructure is created, first of all, server hardening is performed, after its completion, we will get the result and terraform will proceed to the next process:

![image](https://user-images.githubusercontent.com/7732624/219907025-1451b639-1235-4254-8859-18c2dc9c0937.png)

We can check your server using CIS-CAT, the result should be at least 80 score (I recommend running the check after deploying Kubernetes as it makes its own changes):

![image](https://user-images.githubusercontent.com/7732624/219907509-c296e77c-0847-4e91-b87c-3e5c0b3a9d2e.png)


### <a name="deploy-k8s">Deploy K8s</a> [☝️](#finaltask)
After Hardening, deploy Kubernetes will begin, after its completion, Deploy Wordpress will be executed:

![image](https://user-images.githubusercontent.com/7732624/219907099-bf6675c3-2a14-4694-bdf5-687de5c9a455.png)

### <a name="deploy-wordpress">Deploy Wordpress</a> [☝️](#finaltask)
Now Deploy Wordpress starts, after its completion you will get the result:

![image](https://user-images.githubusercontent.com/7732624/219907125-9a7860c3-4593-45f7-982f-11b7bdf5b0ca.png)

### <a name="result">Result</a> [☝️](#finaltask)
At the end of Terraform, you get the result in the form of the number of created resources and the public IP of the server and the private IP of the database (MySQL):<br>
![image](https://user-images.githubusercontent.com/7732624/219907142-5fa238c9-6429-47de-ba45-66c43f2e8b31.png)

Now you should add the server's public ip address to your domain name:<br>
![image](https://user-images.githubusercontent.com/7732624/219907227-f66d5a1f-57bf-4b54-9d3e-04b584e32d00.png)

Now you can go to your domain name and you will get to wordpress where you should choose the language and you will be transferred to create an admin account, you skip the process of joining the database as this process is automated:<br>
URL: http://bohdanhavran.dns.navy/ <br>
![image](https://user-images.githubusercontent.com/7732624/219907239-4afa107c-9425-45ec-bda0-c82b13326960.png)

![image](https://user-images.githubusercontent.com/7732624/219907291-96d672df-e4aa-4ef3-b128-fa786d8ddff9.png)

![image](https://user-images.githubusercontent.com/7732624/219907311-7930d5e9-a95b-40ba-bc9f-2803bd00f765.png)

After completing the previous processes, you get to the wordpress admin panel and now we can use wordpress as you like:<br>
![image](https://user-images.githubusercontent.com/7732624/219907330-6ed18be4-1ea5-4787-bf1e-54d0b5aa2a08.png)

