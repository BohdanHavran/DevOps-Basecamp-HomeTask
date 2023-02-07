# Home Task k8s part 2
In this task, I used Kubespray, which I used to install Kubernetes. To execute it you need an instance, also in this task we will use ingress and receive a certificate. Elements that were used in this task:<br>
[Сreate instance](#create-instance) | [Setup Kubernetes with Kubespray](#setup-kubernetes-with-kubespray) | [Git clone](#git-clone) | [Install Ingress-controller](#install-ingress-controller) | [Create domain name](#create-domain-name) | [Deployment and Ingress](#deployment-and-ingress) | [Certificate](#certificate) | [Result](#result)

# How to start?
First you need to create an instance on which you will install kubernetes using kubespray (if you already have it ready, you can skip to the next steps):

### <a name="create-instance">Сreate instance</a>

Configure VM:<br>
![image](https://user-images.githubusercontent.com/7732624/217242226-b3654270-9b73-4fe5-9917-f9301199b88f.png)<br>
![image](https://user-images.githubusercontent.com/7732624/217242472-d6c33077-c3ae-45ac-85e5-f9f054c8781b.png)

Add your SSH public key:<br>
![image](https://user-images.githubusercontent.com/7732624/217242911-54a684df-5dc9-491f-8245-a60f60f37e4d.png)

Test SSH connection from local machine:<br>
![image](https://user-images.githubusercontent.com/7732624/217244171-81ecec7c-ea63-4267-832d-6d884299adc0.png)

### <a name="setup-kubernetes-with-kubespray">Setup Kubernetes with Kubespray</a>
<b>All commands are executed on the local machine</b>

Clone Kubespray release  repository:
```
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
git checkout release-2.20
```
Copy and edit inventory file:
```
cp -rfp inventory/sample inventory/mycluster
```
```
nano inventory/mycluster/inventory.ini
```
OR
```
vim inventory/mycluster/inventory.ini
```
```
[all]
node1 ansible_host=VM_publick_ip

[kube_control_plane]
node1

[etcd]
node1

[kube_node]
node1

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr
```
Turn on MetalLB:
```
nano inventory/mycluster/group_vars/k8s_cluster/addons.yml
```
OR
```
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
```
```
metallb_enabled: true
metallb_speaker_enabled: true
metallb_avoid_buggy_ips: true
metallb_ip_range:
  - "VM_private_ip/32"
```
```
nano inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
```
OR
```
vim inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
```
```
kube_proxy_strict_arp: true
```
Run execute container (<b>if you don't have [Docker installed](https://docs.docker.com/engine/install/ubuntu/), you should install it</b>):
```
sudo docker run --rm -it -v ~/kubespray:/mnt/kubespray -v ~/.ssh:/pem quay.io/kubespray/kubespray:v2.20.0 bash
```
Go to kubespray folder and start ansible-playbook (command in container):
```
cd /mnt/kubespray
```
```
ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/id_rsa -e ansible_user=remote_user -b cluster.yml
```
![image](https://user-images.githubusercontent.com/7732624/217251644-161e8609-b5e9-4c31-9fa6-16a8241176e4.png)

After successful installation connect to VM and copy kubectl configuration file:
```
ssh -i /pem/id_rsa remote_user@YOUR_VM_IP
```
```
mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chmod 777 ~/.kube/config
kubectl get nodes
```
As result, you will see installed node:<br>
```
kubectl get nodes
```
![image](https://user-images.githubusercontent.com/7732624/217257411-625e1c0c-6273-451c-9656-83592180fa93.png)

### <a name="git-clone">Git clone</a>

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/task13
```

### <a name="install-ingress-controller">Install Ingress-controller</a> 
```
kubectl apply -f nginx-ctl.yaml
```
```
kubectl apply -f path_provisioner.yaml
```

With this command, you will get a list of pods:
```
kubectl get pods -n ingress-nginx -w
```
![image](https://user-images.githubusercontent.com/7732624/217257802-269abf4a-f5d8-4245-b2a3-049924fe32fe.png)

With this command, you will get a list of services:
```
kubectl get svc --all-namespaces
```
![image](https://user-images.githubusercontent.com/7732624/217273874-f3cb4021-9db1-497a-bf65-6670e20a65ee.png)

### <a name="create-domain-name">Create domain name</a>
You can use a free service to get a domain name https://dynv6.com/ (if you have your own domain name, you can use it)<br>
![image](https://user-images.githubusercontent.com/7732624/217261942-1b2a6821-9f37-47b0-9b23-78a5636eebb6.png)

### <a name="deployment-and-ingress">Deployment and Ingress</a>
With this command you will run deployment.yaml file:
```
kubectl apply -f deployment.yaml
```
With this command, you will get a list of pods:
```
kubectl get pods
```
![image](https://user-images.githubusercontent.com/7732624/217263171-7770b83e-e2e7-42d4-ac49-5e7a95b9bc5c.png)

<b>Note</b>
- Before using the following commands, you should change the data in the file to your own

With this command you will run ingress.yaml file:
```
kubectl apply -f ingress.yaml
```
With this command, you will get a list of ingress:
```
kubectl get ingress
```
![image](https://user-images.githubusercontent.com/7732624/217262886-b5e66089-34ab-4f66-9649-52c9a2536954.png)

### <a name="certificate">Certificate</a>
Installing cert-manager:
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
```
<b>Note</b>
- Before using the following commands, you should change the data in the files to your own

Run letsencrypt-staging:
```
kubectl apply -f staging-issuer.yaml
```
Run letsencrypt-prod:
```
kubectl apply -f production-issuer.yaml
```
Now you should uncomment everything in the [ingress.yaml](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task13/ingress.yaml) file and run it again:
```
nano ingress.yaml
```
OR
```
vim ingress.yaml
```
```
kubectl apply -f ingress.yaml
```
Check on the status of the issuer after you create it:
```
kubectl describe issuer letsencrypt-staging
```
![image](https://user-images.githubusercontent.com/7732624/217269070-8e596090-2d61-42f9-bb1c-688627221ff4.png)

Cert-manager will read annotations and create a certificate, which you can request and see:
```
kubectl get certificate
```
![image](https://user-images.githubusercontent.com/7732624/217268081-f0cae2d3-e623-4f81-8dab-fd5063c36bd4.png)

Now you should replace "letsencrypt-staging" with "letsencrypt-prod" in the [ingress.yaml](https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask/blob/main/task13/ingress.yaml) file and run it again:
```
nano ingress.yaml
```
OR
```
vim ingress.yaml
```
```
kubectl apply -f ingress.yaml
```

### <a name="result">Result</a>
URL: https://bohdanhavran.dynv6.net/
![image](https://user-images.githubusercontent.com/7732624/217270268-043949d7-3091-4af4-bfe4-e03872997508.png)<br>
![image](https://user-images.githubusercontent.com/7732624/217270293-78e8ab36-df2d-40aa-8bb9-8f8e797a5f69.png)<br>
![image](https://user-images.githubusercontent.com/7732624/217270323-60123375-b59f-4b9a-9d2c-863b23820c3e.png)
