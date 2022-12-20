# LAMP IN GCP
URL: http://35.203.149.109
 
- [provider.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/provider.tf) is a file in which you need to describe your credits. <br>
- [instance_web.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/instance_web.tf) describes the instructions for creating a virtual machine for running Wordpress. <br>
- [instance_database.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/instance_database.tf) describes the instructions for creating a virtual machine to run the database. <br>
- [bucket.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/bucket.tf) describes the instructions for creating a bucket, which will serve to transfer the private ip address of the database to Wordpress. <br>
- [network.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/network.tf) describes instructions for creating networks and subnets. <br>
- [firewall.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/firewall.tf) describes instructions for creating a firewall for communication. <br>
- [output.tf](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/output.tf) will output the public ip address of the site. <br>
- [start_web.sh](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/start_web.sh) is a file that does all the necessary Wordpress setup in the virtual machine itself for you. <br>
- [database.sh](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task4/database.sh) is a file that performs all the necessary database settings in the virtual machine itself for you

In order to start working with the project, you need:
- git clone git@github.com:BohdanHavran/DevOps-Basecamp-HomeTask.git
- cd DevOps-Basecamp-HomeTask/task4

In order to run this project, you need to enter the following commands:
- terraform init
- terraform apply

If you need to remove a project from AWS:
- terraform destroy

<img width="960" alt="1" src="https://user-images.githubusercontent.com/7732624/208710631-961bd652-afce-4540-b7b9-f098cc0183fd.PNG">
<img width="960" alt="2" src="https://user-images.githubusercontent.com/7732624/208710684-76468521-bdeb-4355-b53a-4c585cf7d6f6.PNG">
<img width="960" alt="3" src="https://user-images.githubusercontent.com/7732624/208710939-be8c461c-f385-45e0-990a-21959ea56623.PNG">
