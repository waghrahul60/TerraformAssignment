#!/bin/bash
sudo yum update -y
sudo yum install -y $package_name
sudo systemctl start $package_name
sudo systemctl enable $package_name
