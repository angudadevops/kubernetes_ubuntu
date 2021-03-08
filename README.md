### This repository will help you to install Kubernetes cluster with ansilbe on baremetal. [![HitCount](http://hits.dwyl.com/angudadevops/kubernetes_baremetal.svg)](http://hits.dwyl.com/angudadevops/kubernetes_baremetal)

- Prerequisites: 
1. Spin up nodes on vmware/virtualbox with ubuntu/RHEL/CentOS, here one node is master and another one for node
2. you can add multiple nodes to the masters 
3. Please update your master and node ip's in hosts file like below
```
[master]
10.110.16.178 ansible_ssh_user=admin ansible_ssh_pass=pass ansible_sudo_pass=pass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
[node]
10.110.16.179 ansible_ssh_user=admin ansible_ssh_pass=pass ansible_sudo_pass=pass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```
4. Update the Required runtime for kubernetes in runtime.yaml, Available runtimes are 

- CRI-O
- Containerd
- Docker

example: 
```
bash setup.sh install
```
### Please raise an issue if you have any difficulties to install the kubernetes cluster with ansible 




