/opt/ansible/bin/ansible-playbook --verbose --extra-vars "image_id=ami-bd990e87 instance_type=t1.small public_ip=$1 instance_name=$2" ~/Documents/cm/provision/launch.yml
