/opt/ansible/bin/ansible-playbook --verbose --inventory-file ~/Documents/cm/ansible_hosts --user root --ask-pass --extra-vars "hosts=$1 hostname=$2" ~/Documents/cm/provision/initialise.yml

/opt/ansible/bin/ansible-playbook --verbose --inventory-file ~/Documents/cm/dev/dev_hosts --user mohammed --private-key ~/Documents/cm/keys/mohammed.pem --sudo --extra-vars "hosts=$1" ~/Documents/cm/dev/configure.yml
