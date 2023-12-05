#!/bin/bash

# Update package list
sudo apt-get update -y

# Install Nginx
sudo apt-get install -y nginx

# Start Nginx
sudo service nginx start
