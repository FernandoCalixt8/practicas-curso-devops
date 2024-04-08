#!/bin/sh
# subir plantillas hijas a s3
export BUCKET_ARTEFACTOS=academia-cloud-devops
aws s3 cp stacks-hijos/dynamo.yaml s3://$BUCKET_ARTEFACTOS/stacks-hijos/dynamo.yaml
aws s3 cp stacks-hijos/sns.yaml s3://$BUCKET_ARTEFACTOS/stacks-hijos/sns.yaml



# # variables
# export NOMBRE_PROYECTO=
# export URL_TEMPLATE_DYNAMO=
# export URL_TEMPLATE_SNS=
# export EMAIL=

# # deploy
# aws cloudformation deploy \
# --parameter-overrides \
#     NombreProyecto=$NOMBRE_PROYECTO \
#     UrlTemplateDynamo=$URL_TEMPLATE_DYNAMO \
#     UrlTemplateSNS=$URL_TEMPLATE_SNS \
#     Email=$EMAIL \
# --template-file principal.yaml \
# --stack-name $NOMBRE_PROYECTO