ansible-playbook --verbose --inventory-file stage --user root site.yml --extra-vars '{"hosts":"ansible.example.com", "hostname":"oam1.example.com", "cookie_domain":".example.com", "deployment_uri":"am", "root_suffix":"o=openam,dc=example,dc=com", "admin_password":"helloworld", "policy_agent_password":"hiworld", "config_store_password":"helloworld"}'