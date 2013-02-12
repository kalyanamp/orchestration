# /opt/ansible/bin/ansible-playbook --verbose --inventory-file ~/Documents/cm/ansible_hosts --ask-pass --extra-vars "newip=$1" ~/Documents/cm/provision/network.yml

/opt/ansible/bin/ansible-playbook --verbose --ask-pass --extra-vars "newip=$1" ~/Documents/cm/provision/network.yml
