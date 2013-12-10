ansible-playbook --verbose --inventory-file stage --user root site.yml --extra-vars '{"hosts":"ansible.example.com", "hostname":"docker1.example.com"}'
