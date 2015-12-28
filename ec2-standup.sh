#!/bin/bash

# Author: Brian Highnam
# file: ec2-standup.sh
# Desription: Automate the standup of EC2 instances

# All of the variables needed to standup the EC2 instances

AMI="ami-60b6c60a" # Amazon Linux AMI 2015.09.01
INSTANCE_TYPE="t2.micro" # free tier eligble  instance
KEY_PAIR="dev-box-key"
SECURITY_GROUPS="sg-f09a6a96"
AZ="us-east-1a"
SUBNET_ID="subnet-921fc1b9"

INSTANCE_ID=""

# kicking off the automated-stand up job for ec2-instance

echo "*************** STANDING UP EC2 INSTANCE ****************************"

 aws ec2 run-instances --image-id "$AMI" \
	--key-name "$KEY_PAIR" \
	--security-group-ids "$SECURITY_GROUPS" \
	--instance-type "$INSTANCE_TYPE" \
	--subnet-id "$SUBNET_ID" \
	--count "1" \
	--user-data "file:////home/brian/sandbox/automate-ec2-standup/bootstrap.sh" \
	--instance-initiated-shutdown-behavior "terminate" \
	--block-device-mapping "file:////home/brian/sandbox/automate-ec2-standup/ebsMapping.json" > output.txt

echo "*************** END OF STANDING UP EC2 INSTANCE ****************************"

INSTANCE_ID=$(cat output.txt | jq -r '.Instances[].InstanceId')

echo "The instance that was spun up was ${INSTANCE_ID}"


