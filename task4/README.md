# LAMP IN GCP
URL: http://35.203.149.109
 
provider.tf is a file in which you need to describe your credits. <br>
instance_web.tf describes the instructions for creating a virtual machine for running Wordpress. <br>
instance_database.tf describes the instructions for creating a virtual machine to run the database. <br>
bucket.tf describes the instructions for creating a bucket, which will serve to transfer the private ip address of the database to Wordpress. <br>
network.tf describes instructions for creating networks and subnets. <br>
firewall.tf describes instructions for creating a firewall for communication. <br>
output.tf will output the public ip address of the site. <br>
start_web.sh is a file that does all the necessary Wordpress setup in the virtual machine itself for you. <br>
database.sh is a file that performs all the necessary database settings in the virtual machine itself for you

In order to start working with the project, you need:
- git clone git@github.com:BohdanHavran/DevOps-Basecamp-HomeTask.git
- cd DevOps-Basecamp-HomeTask/task3

In order to run this project, you need to enter the following commands:
- terraform init
- terraform apply

If you need to remove a project from AWS:
- terraform destroy
