# HomeTask: Docker
I use Docker for these tasks. In the first task for creating a website. In the second task to create two containers based on ubuntu, the first will have access to both the private and public network, and the second only to the private network. If you don't have [Docker installed](https://docs.docker.com/engine/install/ubuntu/), you should install it. Elements that were used in this task:<br>
[Task1: How to start?](#task1-how-to-start) | [Task2: How to start?](#task2-how-to-start)

# <a name="task1-how-to-start">Task1: How to start?</a>

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task10/Task1
```
You need to make a image based on Dockerfile:
```
docker build -t nginx:latest .
```
![image](https://user-images.githubusercontent.com/7732624/214633948-4566fc88-46cc-4457-b56c-224ad75665d5.png)

You need to create a Docker container based on the created image:
```
docker run --name mynginx -d -p 8080:80 nginx:latest
```
Now you can check if your container is running:
```
docker ps
```
![image](https://user-images.githubusercontent.com/7732624/214634236-436a0c9c-7de1-4106-8646-650921d99ef4.png)
<h3>Result:</h3>

![image](https://user-images.githubusercontent.com/7732624/214635178-f4c5ba40-1b1c-4f27-bf6f-2ac04c8f5fc3.png)

# <a name="task2-how-to-start">Task2: How to start?</a>

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task10/Task2
```
You need to make a image based on Dockerfile:
```
docker build -t ubuntu-ping:1.0 .
```
You need to create a public and private network:
```
docker network create public
```
```
docker network create private --internal
```
Now you need to create two Docker containers, and add a private network to the container that we create with a public network:
```
docker run --name ubuntu-public -d --network public ubuntu-ping:1.0
```
```
docker network connect private ubuntu-public
```
```
docker run --name ubuntu-private -d --network private ubuntu-ping:1.0
```
![image](https://user-images.githubusercontent.com/7732624/214640330-69e8dce4-6c5a-4abb-b6df-63702a28e9df.png)

Now you can check if your containers are running:
```
docker ps
```
![image](https://user-images.githubusercontent.com/7732624/214640831-b8d0186e-fd2c-4e64-881e-5f6340993eea.png)

You can check which container is connected to which network:
```
docker network inspect private
```
![image](https://user-images.githubusercontent.com/7732624/214641727-1ffa6a75-c792-4e43-bcde-ddab026d657b.png)
```
docker network inspect publick
```
![image](https://user-images.githubusercontent.com/7732624/214641908-046a4bed-3ad7-4315-a9f3-e57ecbef583a.png)

<h3>Result:</h3>

ubuntu-public: A container that uses public and private networks:

![image](https://user-images.githubusercontent.com/7732624/214642463-998d2a81-49d7-47c3-a6e5-ac9818bbe04a.png)

ubuntu-private: A container that uses a private network:

![image](https://user-images.githubusercontent.com/7732624/214642568-067b50bc-0fb7-49f2-98f3-10e58aff2429.png)
