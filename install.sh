
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""

sudo apt install git ansible vim sshpass openssh-server curl -y

for host in `cat inventory | egrep -v 'master|node'`
   do
	echo $host
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S sed -i  's|PermitRootLogin prohibit-password|PermitRootLogin yes|' /etc/ssh/sshd_config"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S sed -i  's|#PasswordAuthentication yes|PasswordAuthentication yes|' /etc/ssh/sshd_config"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S cat /etc/ssh/sshd_config | grep RootLogin"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S echo 'root:k8s123' | chpasswd"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S systemctl restart sshd"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S mkdir /root/.ssh"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S touch /root/.ssh/authorized_keys"
	sshpass -p $1 ssh anguda@$host "echo $1 | sudo -S apt install git ansible vim sshpass openssh-server -y"
	cat /root/.ssh/id_rsa.pub | sshpass -p k8s123 ssh root@$host "cat >> /root/.ssh/authorized_keys"
   done

ansible-playbook pre_requisites.yaml -i inventory
ansible-playbook k8scluster.yaml -i inventory
