#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_BUCKET_DATALAKE=
export NOMBRE_PROYECTO=

# install requirements
# usar la version correcta de pip
cd src/lambdas/ingesta/
pip install \
-r requirements.txt \
--platform manylinux2014_x86_64 \
--target=. \
--implementation cp \
--python-version 3.12 \
--only-binary=:all: --upgrade
cd ../../..

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_PROYECTO \
--template-file template.yaml \
--output-template-file output-template.yaml

# deploy
aws cloudformation deploy \
--parameter-overrides \
    NombreBucketDatalake=$NOMBRE_BUCKET_DATALAKE \
    NombreProyecto=$NOMBRE_PROYECTO \
--template-file output-template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO