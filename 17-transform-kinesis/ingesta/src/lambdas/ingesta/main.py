import os
import io
import uuid
import json
import base64
import boto3
import pandas as pd



def obtener_registros(registros):
    
    registros_csv   = []

    for registro in registros:
        informacion_base64  = registro['kinesis']['data']
        informacion_string  = base64.b64decode(informacion_base64).decode('utf-8')
        informacion         = json.loads(informacion_string)
        registros_csv.append( (informacion['id_sensor'], informacion['temperatura_sensor']) )

    return registros_csv


def escribir_csv(registros):

    cliente     = boto3.client('s3')

    id          = str( uuid.uuid4() )
    
    sensores_df = pd.DataFrame(registros, columns =['id_sensor', 'temperatura_sensor'])
    
    with io.StringIO() as csv_buffer:
        sensores_df.to_csv(csv_buffer, index=False)
        response = cliente.put_object(
            Bucket      = os.getenv('NOMBRE_BUCKET_DATALAKE'),
            Key         = f'sensores/{id}.csv',
            Body        = csv_buffer.getvalue(),
            ContentType = 'text/csv'
        )


def lambda_handler(event, context):

    registros       = obtener_registros(event['Records'])
    print(registros)

    escribir_csv(registros)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
