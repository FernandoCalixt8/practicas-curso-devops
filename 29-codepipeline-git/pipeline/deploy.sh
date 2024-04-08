#!/bin/sh
export ARN_CONEXION_GIT=
export NOMBRE_REPOSITORIO_GIT=
export RAMA_GIT=master
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_PROYECTO=

# deploy
aws cloudformation deploy \
--parameter-overrides \
    ArnConexionGit=$ARN_CONEXION_GIT \
    NombreRepositorioGit=$NOMBRE_REPOSITORIO_GIT \
    RamaGit=$RAMA_GIT \
    BucketArtefactos=$BUCKET_ARTEFACTOS \
    NombreProyecto=$NOMBRE_PROYECTO \
--template-file template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO-pipeline