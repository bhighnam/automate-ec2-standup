#!/bin/bash

# Author: Brian Highnam
# File: bootstrap.sh
# Description: Contains all of the code to kick off the installation scripts to prep the instance for service 
yum -y update
yum install -y nano
yum install -y puppet
