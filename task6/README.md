# Terraform modules AWS and Azure
URL AWS instance: http://3.20.233.62/ <br>
URL Azure instance: http://104.214.220.220/

<h3>Note</h3>

Using the [main.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task6/main.tf) file, you can configure both an AWS instance and an Azure instance. 
All you need is to simply go to the file, uncomment the desired value and change it to your own.
If you don't have [Terraform installed](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform), you should install it

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task6
```
In order to run this project, you need to enter the following commands:
```
terraform init
```
```
terraform apply
```
If you need to connect to a remote virtual machine:
```
ssh -i ~/.ssh/id_rsa ubuntu@"Public ip AWS or Azure"
```
<b><i><ins>If you use a different ssh key, you should go to [main.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task6/main.tf) and change the data to yours</ins></b></i>

If you need to remove a project:
```
terraform destroy
```

# Output public ip
When you start the project, at the end it will display public IP addresses with which you can connect. It will look like this:

![image](https://user-images.githubusercontent.com/7732624/209582499-aa2e80d9-7d80-4be6-aa95-b1f191afb03d.png)
