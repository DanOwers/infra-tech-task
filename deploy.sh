#!/bin/bash
sudo mvn clean install
sudo mvn package
sudo docker build --pull --rm -f "Dockerfile" -t infratechtask:latest "."
dockerpw=$(aws ecr get-login-password --region ap-southeast-2)
sudo docker login -u AWS -p $dockerpw 376772562533.dkr.ecr.ap-southeast-2.amazonaws.com/infratechtask    
sudo docker image tag infratechtask:latest 376772562533.dkr.ecr.ap-southeast-2.amazonaws.com/infratechtask
sudo docker push 376772562533.dkr.ecr.ap-southeast-2.amazonaws.com/infratechtask

aws s3 cp cloudformation.yml s3://376772562533-cf-templates/ 

aws cloudformation create-stack --stack-name infratechtask --template-url file://376772562533-cf-templates.s3.ap-southeast-2.amazonaws.com/cloudformation.yml --capabilities "CAPABILITY_IAM"