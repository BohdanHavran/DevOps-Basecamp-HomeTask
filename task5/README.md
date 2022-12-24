# Ansible

Main.tf describes instructions for creating a virtual machine on AWS. <br>
user_data.sh is a file that makes all the necessary settings in the virtual machine itself instead of you

In order to start working with the project, you need:
- git clone git@github.com:BohdanHavran/DevOps-Basecamp-HomeTask.git
- cd DevOps-Basecamp-HomeTask/task5

In order to run this project, you need to enter the following commands:
- terraform init
- terraform plan -var ssh_username=<Your linux username>

If you need to remove a project from AWS:
- terraform destroy

![image](https://user-images.githubusercontent.com/7732624/209435856-087aa6ca-e1a5-4b41-970d-8474548659a4.png)
