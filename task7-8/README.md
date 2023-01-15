# Hardening linux password using Ansible and PAM module
In this task, I used Ansible to configure the server so that you cannot change the password to the username. If you don't have [Ansible installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), you should install it

<h3>Note</h3>

You need to go to group_vars/ and edit the [pam](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task7-8/group_vars/pam) file for yourself (I used password as a server login, you can use ssh key, for this you need to uncomment the necessary thread and delete the unnecessary ones). 
Also you need to edit the [hosts.cfg](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task7-8/hosts.cfg)<br>
Tested on:

- Ubuntu 20.04.3 LTS and Ubuntu 18.04 LTS
- Ansible Version: 6.7.0

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task7-8
```
In order to run this project, you need to enter the following command:
```
ansible-playbook playbook.yml
```

# Result
![image](https://user-images.githubusercontent.com/7732624/212552383-7bb38385-d3d0-4310-a891-66cb48ddd789.png)
![image](https://user-images.githubusercontent.com/7732624/212552770-75ce7d9a-7c82-45da-a33a-62e3bd04441b.png)
