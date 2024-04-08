#!/bin/sh
export AWS_REGION=us-east-2
export AWS_ACCOUNT_ID=891376980757
export REPOSITORY_NAME=
export REPOSITORY_URI=$(echo $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPOSITORY_NAME)
export TAG=$(uuidgen) # cambiar por una constante en caso de no tener uuidgen

# build docker image
cd src/lambda/
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
# docker build -t $REPOSITORY_URI:$TAG .
docker buildx build --platform linux/amd64 -t $REPOSITORY_URI:$TAG .
docker tag $REPOSITORY_URI:$TAG $REPOSITORY_URI:latest

# push docker image
docker push $REPOSITORY_URI:$TAG
docker push $REPOSITORY_URI:latest
cd ../..

# deploy stack
export NOMBRE_PROYECTO=$REPOSITORY_NAME
export IMAGE_URI=$REPOSITORY_URI:$TAG

aws cloudformation deploy \
--parameter-overrides \
    ImageUri=$IMAGE_URI \
    NombreProyecto=$NOMBRE_PROYECTO \
--template-file template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO