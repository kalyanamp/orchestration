#!/bin/bash

ansible-playbook -vvvv --inventory-file local --user root --ask-pass site.yml
