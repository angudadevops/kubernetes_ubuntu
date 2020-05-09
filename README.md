### This repository will help you to install Kubernetes cluster with ansilbe on baremetal. [![HitCount](http://hits.dwyl.com/angudadevops/kubernetes_baremetal.svg)](http://hits.dwyl.com/angudadevops/kubernetes_baremetal)

- Prerequisites: 
1. Spin up nodes on vmware/virtualbox with ubuntu/RHEL/CentOS, here one node is master and another one for node
2. you can add multiple nodes to the masters 
3. Please update your master and node ip's in inventory file
4. make sure to use same login password for master and node
5. Run the install.sh with input as your nodes password 
example: 
```
    ./install.sh k8s123
```
### Please raise an issue if you have any difficulties to install the kubernetes cluster with ansible 




