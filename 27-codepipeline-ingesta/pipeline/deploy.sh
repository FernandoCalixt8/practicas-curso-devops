#!/bin/sh
export REPOSITORIO_CODE_COMMIT=
export RAMA_CODE_COMMIT=master
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_PROYECTO=
export LANDING_ZONE_PATH=landing-zone
export STAGING_ZONE_PATH=staging-zone

# deploy
aws cloudformation deploy \
--parameter-overrides \
    RepositorioCodeCommit=$REPOSITORIO_CODE_COMMIT \
    RamaCodeCommit=$RAMA_CODE_COMMIT \
    BucketArtefactos=$BUCKET_ARTEFACTOS \
    NombreProyecto=$NOMBRE_PROYECTO \
    LandingZonePath=$LANDING_ZONE_PATH \
    StagingZonePath=$STAGING_ZONE_PATH \
--template-file template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO-pipeline