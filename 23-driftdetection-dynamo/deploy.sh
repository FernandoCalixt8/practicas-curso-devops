#!/bin/sh
export NOMBRE_TABLA_DYNAMO=
export CAPACIDAD_LECTURA=
export CAPACIDAD_ESCRITURA=

cat > parametros.json <<EOF
{
    "Parameters": {
      "NombreTablaDynamo": "$NOMBRE_TABLA_DYNAMO",
      "CapacidadLectura": "$CAPACIDAD_LECTURA",
      "CapacidadEscritura": "$CAPACIDAD_ESCRITURA"
    }
}
EOF

# deploy
aws cloudformation deploy \
--parameter-overrides file://parametros.json \
--template-file template.yaml \
--stack-name $NOMBRE_TABLA_DYNAMO



# # detectar drift cli
# aws cloudformation describe-stacks
# aws cloudformation detect-stack-drift --stack-name $NOMBRE_TABLA_DYNAMO
# aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id <id>
# aws cloudformation describe-stack-resource-drifts --stack-name $NOMBRE_TABLA_DYNAMO



# # detectar drift python
# export PERFIL=default
# export NOMBRE_STACK=$NOMBRE_TABLA_DYNAMO

# # usar la version correcta de python
# # usar el path correcto del entorno
# # usar la version correcta de pip
# cd lambda-drift-detection
# python -m venv env
# source env/bin/activate
# pip install boto3
# python main.py