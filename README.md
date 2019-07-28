This repository will help you to install Kubernetes cluster with ansilbe on Ubuntu
Prerequisites: 
1. Spin up two nodes on vmware/virtualbox with ubuntu, here one node is master and another one node
2. Please make sure to install ansible on master and copy the ssh keys to node, for more information go through the link https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04
3. Update you ansilbe hosts configuration with master and nodes under web group

Once you're done with above steps run first pre_requisites.yaml and then 
k8scluster.yaml. it will create a cluster with one master and one node. if you want to join more nodes you can add it in ansible hosts and update k8cluster.yaml based on that 

Please raise an issue if you have any difficulties to install the kubernetes cluster with ansible 




