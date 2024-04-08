import os
import uuid
import json
import random
import boto3

# variables
perfil          = os.getenv('PERFIL')
nombre_stream   = os.getenv('NOMBRE_STREAM')

# cliente kinesis
sesion          = boto3.session.Session(profile_name=perfil)
cliente         = sesion.client('kinesis')

# creacion de registros
registros       = []
for index in range(500):
    
    informacion_sensor  = {
        "temperatura_sensor":   random.randint(0, 20),
        "id_sensor":            index
    }
    print(informacion_sensor)

    registro            = {
        'Data':         bytes(json.dumps(informacion_sensor), 'utf-8'),
        'PartitionKey': str( uuid.uuid4() )
    }
    registros.append(registro)
    print(registro)
    print('='*50)

# insercion
response    = cliente.put_records(
    Records     = registros,
    StreamName  = nombre_stream
)