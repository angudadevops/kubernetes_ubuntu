#!/bin/bash

if [ -z $1 ]; then
	echo -e "Usage: \n bash setup.sh [OPTIONS]\n \n Available Options: \n      install     Install Kubernetes Stack\n      uninstall   Uninstall Kubernetes Stack"
	echo
	exit 1
fi

sudo ls > /dev/null

# Ansible Install
ansible_install() {
	os=$(cat /etc/os-release | grep -iw ID | awk -F'=' '{print $2}') 
	version=$(cat /etc/os-release | grep -i VERSION_CODENAME | awk -F'=' '{print $2}')
	if [[ $os == "ubuntu" && $version != "focal" ]]; then 
		echo "Installing Ansible"
        	sudo apt-add-repository ppa:ansible/ansible -y
        	sudo apt update
        	sudo apt install ansible sshpass -y
	elif [[ $os == "ubuntu" && $version == "focal" ]]; then
		echo "Installing Ansible"
		sudo apt update
        	sudo apt install ansible sshpass -y
	elif [ $os == "rhel*" ]; then
		version=$(cat /etc/os-release | grep VERSION_ID | awk -F'=' '{print $2}')
		if [ $version == "*7.*" ]; then
			sudo subscription-manager repos --enable rhel-7-server-ansible-2.9-rpms
			sudo yum install ansible -y
		elif [ $version == "*8.*" ]; then
			sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
			sudo yum install ansible -y
		fi
	fi
}
if ! hash sudo ansible 2>/dev/null
then 
	ansible_install
else
	echo "Ansible Already Installed"
	echo
fi
if [ $1 == "install" ]; then
	echo
	read -p "Enter Kubernetes Runtime: " runtime
	if [[ $runtime == 'crio' || $runtime == 'containerd' || $runtime == 'docker' ]]; then
		current=$(cat ansible/runtime.yaml | awk '{print $2}' | tail -1f)
		sed -ie "s/$current/$runtime/g" ansible/runtime.yaml
		echo Container RunTime $(cat ansible/runtime.yaml | awk -F':' '{print $2}')
		echo
	else
		echo
		echo "Available Runtimes are crio, containerd, docker"
		exit 1
		echo
	fi

	echo "Installing Kubernetes Cluster"
	cd ansible
	ansible-playbook -i hosts prerequisites.yaml	
	ansible-playbook -i hosts k8sinstall.yaml
	cd ../
elif [ $1 == "uninstall" ]; then
	echo
	echo "Unstalling Kubernetes Cluster"
	cd ansible
        ansible-playbook -i hosts k8suninstall.yaml
	cd ../
else
	echo -e "Usage: \n bash setup.sh [OPTIONS]\n \n Available Options: \n      install     Install Kubernetes Stack\n      uninstall   Uninstall Kubernetes Stack"
        echo
        exit 1
fi

