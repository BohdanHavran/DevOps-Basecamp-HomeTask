# Home Task k8s part 1


# How to start? 
In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task12
```

```
kubectl create ns task
```
![image](https://user-images.githubusercontent.com/7732624/216736640-ce2f83c1-2825-4e33-898e-c67b0f16ca6a.png)

```
kubectl get ns
```
![image](https://user-images.githubusercontent.com/7732624/216736708-b8173acd-60c1-4072-881d-4d79ee470cb4.png)

```
kubectl apply -n task -f ./
```
![image](https://user-images.githubusercontent.com/7732624/216736659-cf520641-eb32-4519-bc3a-44d076156e6f.png)

```
kubectl get deploy -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737280-3f430a6d-19cc-45a6-8297-6e98c46e1e36.png)

```
kubectl get pods -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737342-3303ea89-ca6a-4de6-ac10-cbb50a50b4cb.png)

```
kubectl get svc -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737373-4ca90d8f-29ed-44c4-a406-22bc3dc88b83.png)

```
kubectl describe deploy apache-deployment -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737520-435b906c-e61a-4abc-8d93-3bc382a3b8ec.png)

```
kubectl describe pods apache-deployment-6b87997db9-zb7p5 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737787-949f95af-c1fd-4333-9179-6c70cc777b9a.png)


```
kubectl describe svc clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737602-778ebca9-86e0-47c3-aec7-0ab9214eb8e6.png)

```
kubectl describe svc nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737638-730e7982-cc8c-4bfc-9964-08591f576de1.png)

```
kubectl logs apache-deployment-6b87997db9-zb7p5 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216737941-e2f69fdf-ab2d-4570-bf24-02c06aed2581.png)

### JOB

```
kubectl get job -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738079-4980941f-9277-4769-8184-1afcf52b143e.png)

```
kubectl logs job/job-clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738530-c9ae1b95-1ad6-474b-b897-16020b3005a6.png)

```
kubectl describe job job-clusterip -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739228-26ba76d0-a11f-4f6f-841b-5e629290582f.png)

```
kubectl logs job/job-nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216738932-cdc24604-c05c-472c-968f-7f1075d4a1d7.png)

```
kubectl describe job job-nodeport -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739190-00d5da49-c151-421e-9c7e-f59ffaf4a377.png)

### CronJob

```
kubectl get cj -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739396-133559bb-dfc6-48fb-bdd7-ca6101615579.png)

```
kubectl get job -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739479-6b48b5e0-26f4-4bfc-a659-3ef756e7f9a9.png)

```
kubectl logs job/cronjob-27924576 -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739538-4c2c65e9-cf5a-41e2-bac3-939d81ae0691.png)

```
kubectl describe cj cronjob -n task
```
![image](https://user-images.githubusercontent.com/7732624/216739671-98166c0d-c139-4b27-b55d-fa5c2aacd546.png)



