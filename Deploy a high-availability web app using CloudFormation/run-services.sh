#!/bin/bash

STACK_NAME="highly-available-website-servers"
ACTION=$1

case $ACTION in
    
    create)
        aws cloudformation create-stack \
        --stack-name $STACK_NAME \
        --template-body file:///home/jovyan/aws/services.yml \
        --parameters file:///home/jovyan/aws/services-parameters.json \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
        --region=us-west-2
        ;;

    update)
        aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file:///home/jovyan/aws/services.yml \
        --parameters file:///home/jovyan/aws/services-parameters.json
        ;;

    delete)
        aws cloudformation delete-stack \
        --stack-name $STACK_NAME
        ;;

    *)
        echo -n "unknown argument, expection either (create | update | delete)"
        ;;
esac