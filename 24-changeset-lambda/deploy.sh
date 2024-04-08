#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_LAMBDA=
export TIMEOUT_LAMBDA=

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_LAMBDA \
--template-file template.yaml \
--output-template-file output-template.yaml

cat > parametros.json <<EOF
{
    "Parameters": {
      "NombreLambda": "$NOMBRE_LAMBDA",
      "TimeoutLambda": "$TIMEOUT_LAMBDA"
    }
}
EOF

# deploy
aws cloudformation deploy \
--parameter-overrides file://parametros.json \
--capabilities CAPABILITY_NAMED_IAM \
--template-file output-template.yaml \
--stack-name $NOMBRE_LAMBDA



# # create change set
# aws cloudformation create-change-set \
# --parameters \
#     ParameterKey=NombreLambda,ParameterValue=$NOMBRE_LAMBDA \
#     ParameterKey=TimeoutLambda,ParameterValue=$TIMEOUT_LAMBDA \
# --change-set-name $NOMBRE_LAMBDA \
# --capabilities CAPABILITY_NAMED_IAM \
# --template-body file://output-template.yaml \
# --stack-name $NOMBRE_LAMBDA



# # execute change set
# aws cloudformation execute-change-set \
# --stack-name $NOMBRE_LAMBDA \
# --change-set-name $NOMBRE_LAMBDA