#!/bin/bash

ansible-playbook --verbose --inventory-file stage --user root uninstall.yml --extra-vars '{"hosts":"fresh1.example.com", "deployment_uri":"am"}'
