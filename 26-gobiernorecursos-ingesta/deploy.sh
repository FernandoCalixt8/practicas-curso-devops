#!/bin/sh
export BUCKET_ARTEFACTOS=academia-cloud-devops
export NOMBRE_PROYECTO=
export LANDING_ZONE_PATH=landing-zone
export STAGING_ZONE_PATH=staging-zone

# package
aws cloudformation package \
--s3-bucket $BUCKET_ARTEFACTOS \
--s3-prefix $NOMBRE_PROYECTO \
--template-file template.yaml \
--output-template-file output-template.yaml

cat > parametros.json <<EOF
{
    "Parameters": {
      "NombreProyecto": "$NOMBRE_PROYECTO",
      "LandingZonePath": "$LANDING_ZONE_PATH",
      "StagingZonePath": "$STAGING_ZONE_PATH"
    }
}
EOF

# deploy
aws cloudformation deploy \
--parameter-overrides file://parametros.json \
--template-file output-template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name $NOMBRE_PROYECTO



# # subir archivo
# aws s3 cp informacion-historica/annual-enterprise-survey.csv s3://<NombreBucket>/$LANDING_ZONE_PATH/annual-enterprise-survey.csv



# # termination protection
# aws cloudformation update-termination-protection \
# --stack-name $NOMBRE_PROYECTO \
# --enable-termination-protection

# cat > politica-stack.json <<EOF
# {
#   "Statement" : [
#     {
#         "Effect" : "Allow",
#         "Action" : "Update:*",
#         "Principal": "*",
#         "Resource" : "LogicalResourceId/RolJobIngesta"
#     },
#     {
#         "Effect" : "Allow",
#         "Action" : "Update:*",
#         "Principal": "*",
#         "Resource" : "LogicalResourceId/JobIngesta"
#     }
#   ]
# }
# EOF

# # set stack policy
# aws cloudformation set-stack-policy \
# --stack-name $NOMBRE_PROYECTO \
# --stack-policy-body file://politica-stack.json