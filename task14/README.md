# Home Task K8S Helm

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task14
```
If you don't have Helm you should install it:
```
sudo snap install helm --classic
```
### Task1 deploy Nginx
With this command you will run the helm chart:
```
helm install nginx-helm nginx/
```
![image](https://user-images.githubusercontent.com/7732624/218249182-edee4dd0-228e-47c9-9283-74948f4b9154.png)

With this command, you can view the list of releases:
```
helm ls
```
![image](https://user-images.githubusercontent.com/7732624/218249441-59533271-9a2d-467c-981b-96629bdad945.png)

With the help of this command, you can view all the resources that have been created:
```
kubectl get all
```
![image](https://user-images.githubusercontent.com/7732624/218249202-86c7274a-458f-4977-bfbe-919ef88f3d2b.png)

With the help of this command, you can change some parameters:
```
helm upgrade --install --atomic nginx-helm nginx/ --set replicaCount=4
```
![image](https://user-images.githubusercontent.com/7732624/218249264-8f98cade-5ce4-4da6-b1f3-9ac3924baec9.png)

With the help of this command, you can view all the resources that have been created:
```
kubectl get all
```
![image](https://user-images.githubusercontent.com/7732624/218249276-cfb1ff70-4e37-4cf9-8e0a-1ea227e81169.png)

<b>Result:</b><br>
URL: https://bohdanhavran.dynv6.net/nginx-helm

<b>Note:</b>
- host can be changed in the values.yaml file or when starting helm chart change its value using --set host=<your_domain_name>
- /pach depends on the name releases

![image](https://user-images.githubusercontent.com/7732624/218249315-fb77393d-84be-4a67-bd26-4a6302c969df.png)

### Task2 deploy Pacman
With this command you will run the helm chart:
```
helm install pacman pacman/
```
![image](https://user-images.githubusercontent.com/7732624/218249554-ce3d84fd-06ed-4db6-a1b6-d7a8bf8112b3.png)

With this command, you can view the list of releases:
```
helm ls
```
![image](https://user-images.githubusercontent.com/7732624/218249568-eb34b93e-f079-4bc1-9d78-fcae01246638.png)

With the help of this command, you can view all the resources that have been created:
```
kubectl get all
```
![image](https://user-images.githubusercontent.com/7732624/218249585-e0797b2e-db49-46d4-89d3-f2bdf7f43dc0.png)

<b>Result:</b><br>
URL: https://bohdanhavran.dynv6.net/pacman

<b>Note:</b>
- host can be changed in the values.yaml file or when starting helm chart change its value using --set host=<your_domain_name>
- /pach depends on the name releases

![image](https://user-images.githubusercontent.com/7732624/218249599-aef80936-e25b-4d13-a7af-683a566179b6.png)

### Task3 deploy MERN stack (not mandatory)

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```
helm install mern-stack bitnami/node
```

```
helm ls
```

```
kubectl get all
```

URL: https://bohdanhavran.dynv6.net/mern
