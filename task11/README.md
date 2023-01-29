# Task: Setup Kubernetes
Prepare 2 VMs (kubemaster and kubenode) with the same parametrs

Requirements:
- 4 CPU
- 8 GB RAM

![image](https://user-images.githubusercontent.com/7732624/215360111-d8f7f882-b5c6-41b1-bf7b-2409ffee0026.png)<br>
![image](https://user-images.githubusercontent.com/7732624/215360094-73327efa-b83d-4224-a78d-248b7f576e4d.png)
![image](https://user-images.githubusercontent.com/7732624/215360168-70f6def4-5c31-427d-a886-55c7e9465941.png)

Commands:
```
sudo apt update
```
```
sudo apt upgrade -y
```
Edit the hosts file with the command:
```
sudo nano /etc/hosts
```
OR
```
sudo vim /etc/hosts
```
Put your private IP address and hostname

![image](https://user-images.githubusercontent.com/7732624/215360379-04b9e543-e234-48f0-9259-421ad851a4c1.png)

Install the first dependencies with:
```
sudo apt install curl apt-transport-https -y
```
Next, add the necessary GPG key with the command:
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```
Add the Kubernetes repository with:
```
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
Update apt:
```
sudo apt update
```
Install the required software with the command:
```
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
```
Place kubelet, kubeadm, and kubectl on hold with:
```
sudo apt-mark hold kubelet kubeadm kubectl
```
Start and enable the kubelet service with:
```
sudo systemctl enable --now kubelet
```
Next, we need to disable swap on both kubemaster. Open the fstab file for editing with:
```
sudo nano /etc/fstab
```
OR
```
sudo vim /etc/fstab
```
Save and close the file. You can either reboot to disable swap or simply issue the following command to finish up the job:
```
sudo swapoff -a
```

Enable Kernel Modules and Change Settings in sysctl:
```
sudo modprobe overlay
```
```
sudo modprobe br_netfilter
```
Change the sysctl settings by opening the necessary file with the command:
```
sudo nano /etc/sysctl.d/kubernetes.conf
```
Look for the following lines and make sure they are set as you see below:
```
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```
Save and close the file. Reload sysctl with:
```
sudo sysctl --system
```
Install containerd

Install the necessary dependencies with:
```
sudo apt install curl gnupg2 software-properties-common apt-transport-https ca-certificates -y
```
Add the GPG key with:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Add the required repository with:
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
Install containerd with the commands:
```
sudo apt update
```
```
sudo apt install containerd.io -y
```
Change to the root user with:
```
sudo su
```
Create a new directory for containerd with:
```
mkdir -p /etc/containerd
```
Generate the configuration file with:
```
containerd config default>/etc/containerd/config.toml
```
Exit from the root user with:
```
exit
```
Restart containerd with the command:
```
sudo systemctl restart containerd
```
Enable containerd to run at startup with:
```
sudo systemctl enable containerd
```
Initialize the Master Node

Pull down the necessary container images with:
```
sudo kubeadm config images pull
```
<i><b>Command only for kubemaster</b></i> :

Now, using the kubemaster IP address initialize the master node with:
```
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```
<i><b>Result:</b></i>

![image](https://user-images.githubusercontent.com/7732624/215360783-e35566b5-1bf3-4f32-a45a-6aee44358396.png)

Finally, you need to create a new directory to house a configuration file and give it the proper permissions which is done with the following commands:
```
mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
List Kubernetes Nodes:
```
kubectl get nodes
```
![image](https://user-images.githubusercontent.com/7732624/215360636-5dddc38c-d933-4d79-9205-ae3dc1d64478.png)

<i><b>Command only for kubenode</b></i> :

Install network:
```
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
```
```
curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml -O
```
```
kubectl create -f custom-resources.yaml
```
Wait when all pods will be ready:
```
kubectl get pods --all-namespaces -w
```
![image](https://user-images.githubusercontent.com/7732624/215360677-c50d06e8-355f-449e-9fb8-b5cc909be9d7.png)

<i><b>Result:</b></i>
```
kubectl get nodes -o wide
```
![image](https://user-images.githubusercontent.com/7732624/215360703-1f64cfb5-730c-4c0f-8036-3d278b62cccc.png)
