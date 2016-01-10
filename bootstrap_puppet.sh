#!/bin/bash

# Brian Highnam
# File: bootstrap_puppet.sh
# Description: Install puppet and install and run a specific puppet module that will install apache and grab the basic html files from a Amazon S3 bucket

# install the puppet server
yum install -y puppet-server

# update the box
yum update -y

# grab the tarball with the puppet module from the S3 bucket

# create the modules directory in the /etc/puppet/ file path
mkdir /etc/puppet/modules

# extract the tarball and shove it into the /etc/puppet/modules directory

# kick off the apache config
puppet apply /etc/puppet/manifests/site.pp