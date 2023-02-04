# Home Task k8s part 1
In this task I used Kubernetes. To perform it, you need a cluster, if you don't have one, you can create it according to the instructions in my [repository](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/tree/main/task11) (I used the cluster I created on the last task). Elements that were used in this task:<br>
[Information about worker node](#information-about-worker-node) | [Namespace](#namespace) | [Deployment and Service](#deployment-and-service) | [Job](#job) | [CronJob](#cronjob)

# How to start? 
In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task12
```
### Note
Before running the commands, you should replace the public IP address in [job-nodeport.yaml](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task12/job-nodeport.yaml)

### <a name="information-about-worker-node">Information about worker node</a>
With the help of this command, you will get a description of the node, which will be displayed in the console:
```
kubectl describe node kubenode
```
With the help of this command, you will get information about the node, which will be saved in another file:
```
echo "$(kubectl describe node kubenode)" > info.txt
```
### <a name="namespace">Namespace</a>
Create a new namespace:
```
kubectl create ns task
```
![image](https://user-images.githubusercontent.com/7732624/216736640-ce2f83c1-2825-4e33-898e-c67b0f16ca6a.png)

Viewing namespaces:
```
kubectl get ns
```
![image](https://user-images.githubusercontent.com/7732624/216736708-b8173acd-60c1-4072-881d-4d79ee470cb4.png)

### <a name="deployment-and-service">Deployment and Service</a>
With this command you will run all yaml files in the directory, if you need to run something specific, replace ./ with the name of the file:
```
kubectl apply -n task -f ./
```
![image](https://user-images.githubusercontent.com/7732624/216736659-cf520641-eb32-4519-bc3a-44d076156e6f.png)

With this command you will get a list of deployments in a specific namespace:
```
kubectl get deploy -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737280-3f430a6d-19cc-45a6-8297-6e98c46e1e36.png)

With this command you will get a list of pods in a specific namespace:
```
kubectl get pods -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737342-3303ea89-ca6a-4de6-ac10-cbb50a50b4cb.png)

With this command, you will get a list of services in a specific namespace:
```
kubectl get svc -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737373-4ca90d8f-29ed-44c4-a406-22bc3dc88b83.png)

With this command, you will get a description of the deployment in a specific namespace:
```
kubectl describe deploy apache-deployment -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737520-435b906c-e61a-4abc-8d93-3bc382a3b8ec.png)

With this command you will get a description of the pod in a specific namespace:
```
kubectl describe pods apache-deployment-6b87997db9-zb7p5 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737787-949f95af-c1fd-4333-9179-6c70cc777b9a.png)

With the help of this command, you will get a description of the service in a specific namespace:
```
kubectl describe svc clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737602-778ebca9-86e0-47c3-aec7-0ab9214eb8e6.png)

With the help of this command, you will get a description of the service in a specific namespace:
```
kubectl describe svc nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737638-730e7982-cc8c-4bfc-9964-08591f576de1.png)

With the help of this command, you will get a log of the pod in a specific namespace:
```
kubectl logs apache-deployment-6b87997db9-zb7p5 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737941-e2f69fdf-ab2d-4570-bf24-02c06aed2581.png)

### <a name="job">Job</a>
With this command you will get a list of jobs in a specific namespace:
```
kubectl get job -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738079-4980941f-9277-4769-8184-1afcf52b143e.png)

With the help of this command, you will get a log of the job in a specific namespace:
```
kubectl logs job/job-clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738530-c9ae1b95-1ad6-474b-b897-16020b3005a6.png)

With the help of this command, you will get a description of the job in a specific namespace:
```
kubectl describe job job-clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739228-26ba76d0-a11f-4f6f-841b-5e629290582f.png)

With the help of this command, you will get a log of the job in a specific namespace:
```
kubectl logs job/job-nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738932-cdc24604-c05c-472c-968f-7f1075d4a1d7.png)

With the help of this command, you will get a description of the job in a specific namespace:
```
kubectl describe job job-nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739190-00d5da49-c151-421e-9c7e-f59ffaf4a377.png)

### <a name="cronjob">CronJob</a>
With this command you will get a list of cronjob in a specific namespace:
```
kubectl get cj -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739396-133559bb-dfc6-48fb-bdd7-ca6101615579.png)

With the help of this command, you will get a list of job created by cronjob in a certain namespace:
```
kubectl get job -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739479-6b48b5e0-26f4-4bfc-a659-3ef756e7f9a9.png)

With the help of this command, you will get a log of job created by cronjob in a specific namespace:
```
kubectl logs job/cronjob-27924576 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739538-4c2c65e9-cf5a-41e2-bac3-939d81ae0691.png)

With the help of this command, you will get a description of the cronjob in a specific namespace:
```
kubectl describe cj cronjob -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739671-98166c0d-c139-4b27-b55d-fa5c2aacd546.png)



