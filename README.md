# Kubernetes on Baremetal

[![HitCount](http://hits.dwyl.com/angudadevops/kubernetes_baremetal.svg)](http://hits.dwyl.com/angudadevops/kubernetes_baremetal)



## Prerequisites: 
1. Spin up nodes on vmware/virtualbox with ubuntu/RHEL/CentOS, here one node is master and another one for node
2. you can add multiple nodes to the masters 
3. Please update your master and node ip's in hosts file like below
```
[master]
10.110.16.178 ansible_ssh_user=admin ansible_ssh_pass=pass ansible_sudo_pass=pass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
[node]
10.110.16.179 ansible_ssh_user=admin ansible_ssh_pass=pass ansible_sudo_pass=pass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```
4. Provide container runtime to the script, Available runtimes are 

- CRI-O
- Containerd
- Docker

## Setup
Run the below command to Install Kubernetes cluster

```
bash setup.sh install
```

## Uninstall

Run the below command to uninstall Kubernetes cluster

```
bash setup.sh uninstall

```
### Please raise an issue if you have any difficulties to install the kubernetes cluster with ansible 




