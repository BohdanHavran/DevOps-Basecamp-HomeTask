# Home Task k8s part 2


# How to start?

First you need to create an instance on which you will install kubernetes using kubespray (if you already have it ready, you can skip to the next steps):

Configure VM:<br>
![image](https://user-images.githubusercontent.com/7732624/217242226-b3654270-9b73-4fe5-9917-f9301199b88f.png)<br>
![image](https://user-images.githubusercontent.com/7732624/217242472-d6c33077-c3ae-45ac-85e5-f9f054c8781b.png)

Add your SSH public key:<br>
![image](https://user-images.githubusercontent.com/7732624/217242911-54a684df-5dc9-491f-8245-a60f60f37e4d.png)

Test SSH connection from local machine:<br>
![image](https://user-images.githubusercontent.com/7732624/217244171-81ecec7c-ea63-4267-832d-6d884299adc0.png)

### Setup Kubernetes with Kubespray
<b>All commands are executed on the local machine</b>

Clone Kubespray release  repository:
```
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
git checkout release-2.20
```
