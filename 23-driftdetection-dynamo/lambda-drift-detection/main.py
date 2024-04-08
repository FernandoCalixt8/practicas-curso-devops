import os
import time
import boto3

# variables
perfil          = os.getenv('PERFIL')
nombre_stack    = os.getenv('NOMBRE_STACK')


# cliente boto3
sesion          = boto3.session.Session(profile_name=perfil)
cliente         = sesion.client('cloudformation')


#####################################
# ejecutamos la deteccion de drift
#####################################
print('='*80)
respuesta       = cliente.detect_stack_drift(
    StackName = nombre_stack
)
id_drift_detection = respuesta['StackDriftDetectionId']
print(id_drift_detection)


#####################################
# estado de la deteccion del drift
#####################################
print('='*80)
ejecutar        = True
while ejecutar:
    time.sleep(1)
    respuesta       = cliente.describe_stack_drift_detection_status(
        StackDriftDetectionId = id_drift_detection
    )
    if respuesta['DetectionStatus'] != 'DETECTION_IN_PROGRESS':
        ejecutar = False
print(respuesta['DetectionStatus'])


#####################################
# recursos con drift
#####################################
print('='*80)
respuesta = cliente.describe_stack_resource_drifts(
    StackName = nombre_stack
)
for recursos in respuesta['StackResourceDrifts']:
    print('Propiedades actuales')
    print(recursos['ActualProperties'])

    print('Propiedades esperadas')
    print(recursos['ExpectedProperties'])