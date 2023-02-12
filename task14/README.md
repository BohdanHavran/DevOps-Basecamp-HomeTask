# Home Task K8S Helm
In what task did we deploy to Kubernetes using Helm. in the task I used ingress and the certificate we created in the last task.<br> Elements that were used in this task:<br> [Task1 deploy Nginx](#task1-deploy-nginx) | [Task2 deploy Pacman](#task2-deploy-pacman) | [Task3 deploy MERN stack](#task3-deploy-mern-stack)

<b>Note:</b>
- You must edit the values.yaml file before starting (depends on the project you are running)
- You can also use --set when starting the project and replace the required data with your own to avoid editing the file

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
### <a name="task1-deploy-nginx">Task1 deploy Nginx</a>
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

### <a name="task2-deploy-pacman">Task2 deploy Pacman</a>
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
URL: https://bohdanhavran.dynv6.net/

<b>Note:</b>
- host can be changed in the values.yaml file or when starting helm chart change its value using --set host=<your_domain_name>

![image](https://user-images.githubusercontent.com/7732624/218249599-aef80936-e25b-4d13-a7af-683a566179b6.png)

### <a name="task3-deploy-mern-stack">Task3 deploy MERN stack</a>
With this command you will add the repository:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```
![image](https://user-images.githubusercontent.com/7732624/218251795-231ab79a-bbf5-492d-9d25-6bc98bee4ea8.png)

With this command you will run the helm chart:
```
helm install mern-stack bitnami/node
```
![image](https://user-images.githubusercontent.com/7732624/218251817-801fe89f-865e-41f7-9175-e10866f03b5f.png)

With this command, you can view the list of releases:
```
helm ls
```
![image](https://user-images.githubusercontent.com/7732624/218251829-1cd73880-c5e2-44b5-a48d-7959d384f959.png)

With the help of this command, you can view all the resources that have been created:
```
kubectl get all
```
![image](https://user-images.githubusercontent.com/7732624/218251866-3b533c0c-3539-44a5-8c95-0d285e09e64d.png)

<b>Note:</b>
- Before using the following commands, you should change the data in the file to your own

For this task you still need to run ingress and with this command you will successfully complete it:
```
kubectl apply -f mern/ingress.yaml
```
![image](https://user-images.githubusercontent.com/7732624/218252218-91eaf4f0-d2a6-4e01-a709-1c8bb892e83c.png)

<b>Result:</b><br>
URL: https://bohdanhavran.dynv6.net/mern
![image](https://user-images.githubusercontent.com/7732624/218251917-470c93a6-bcfb-4415-be5c-8656f1f0f0e0.png)
