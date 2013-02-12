/opt/ansible/bin/ansible-playbook --extra-vars "newip=$1" ~/Documents/cm/provision/network.yml

/opt/ansible/bin/ansible-playbook --user root --extra-vars "hosts=$1 hostname=$2" ~/Documents/cm/provision/initialise.yml
