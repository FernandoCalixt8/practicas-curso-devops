#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_LAMBDA=

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_LAMBDA \
--template-file template.yaml \
--output-template-file output-template.yaml \
--profile default

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreLambda=$NOMBRE_LAMBDA \
--capabilities CAPABILITY_NAMED_IAM \
--template-file output-template.yaml \
--stack-name $NOMBRE_LAMBDA \
--profile default



# # delete
# aws cloudformation delete-stack \
# --stack-name $NOMBRE_LAMBDA