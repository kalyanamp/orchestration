#!/bin/bash

ansible-playbook --verbose --inventory-file stage --user root install.yml --extra-vars '{"hosts":"fresh1.example.com", "hostname":"oam1.example.com", "cookie_domain":".example.com", "deployment_uri":"am", "root_suffix":"o=openam,dc=example,dc=com", "admin_password":"helloworld", "policy_agent_password":"heyworld", "config_store_password":"helloworld", "install_admin_tools":"yes"}'
