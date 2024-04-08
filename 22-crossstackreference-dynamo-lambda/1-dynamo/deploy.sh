#!/bin/sh
export NOMBRE_TABLA_DYNAMO=

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreTablaDynamo=$NOMBRE_TABLA_DYNAMO \
--template-file template.yaml \
--stack-name $NOMBRE_TABLA_DYNAMO-dynamo