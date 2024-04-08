#!/bin/sh
export NOMBRE_PROYECTO=
export VPC=vpc-0056b38c4abc95dcc
export SUBNETS_RDS=subnet-040c2e2e5d876f21c,subnet-07c34e339ca3fd5aa,subnet-026b4ceee1eb59ae9
export USUARIO=postgres
export CONTRASENA=Admin1234

cat > parametros.json <<EOF
{
  "Parameters": {
    "NombreProyecto": "$NOMBRE_PROYECTO",
    "VPC": "$VPC",
    "SubnetsRds": "$SUBNETS_RDS",
    "Usuario": "$USUARIO",
    "Contrasena": "$CONTRASENA"
  }
}
EOF

# deploy
aws cloudformation deploy \
--parameter-overrides file://parametros.json \
--capabilities CAPABILITY_NAMED_IAM \
--template-file template.yaml \
--stack-name $NOMBRE_PROYECTO