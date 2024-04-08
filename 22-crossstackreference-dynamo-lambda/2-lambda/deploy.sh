#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_LAMBDA=
export NOMBRE_STACK_DYNAMO=

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_LAMBDA \
--template-file template.yaml \
--output-template-file output-template.yaml

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreLambda=$NOMBRE_LAMBDA \
    NombreStackDynamo=$NOMBRE_STACK_DYNAMO \
--capabilities CAPABILITY_NAMED_IAM \
--template-file output-template.yaml \
--stack-name $NOMBRE_LAMBDA-lambda