#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_PROYECTO=

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_PROYECTO \
--template-file template.yaml \
--output-template-file output-template.yaml

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreProyecto=$NOMBRE_PROYECTO \
--template-file output-template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO