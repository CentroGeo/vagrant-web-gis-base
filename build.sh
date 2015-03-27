#!/bin/bash

# to build django-base-v2.box:
vagrant up
rm -f geoweb-base-v1.0.box
vagrant package --output geoweb-base-v1.0.box

# to install locally:
# vagrant box add geoweb-base-v1.0.box geoweb-base-v1.0.box
