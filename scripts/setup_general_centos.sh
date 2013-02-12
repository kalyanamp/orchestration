/opt/ansible/bin/ansible-playbook --verbose --inventory-file ~/Documents/cm/ansible_hosts --user root --ask-pass --extra-vars "newip=$1 hosts=$1" ~/Documents/cm/provision/initialise.yml
