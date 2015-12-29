#!/bin/bash

# Author: Brian Highnam
# File: bootstrap.sh
# Description: Contains all of the code to kick off the installation scripts to prep the instance for service

# stands a standard apache web server with a basic html test page to say that the instance is alive 
yum -y update
yum install -y nano
yum install -y httpd24
service httpd start
