#!/bin/sh
export NOMBRE_PROYECTO=
export VPC_CIDR=

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreProyecto=$NOMBRE_PROYECTO \
    VpcCidr=$VPC_CIDR \
--template-file template.yaml \
--stack-name $NOMBRE_PROYECTO