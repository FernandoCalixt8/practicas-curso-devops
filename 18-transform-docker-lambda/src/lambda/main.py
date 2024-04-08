import json
import requests


def lambda_handler(event, context):

    url             = 'https://jsonplaceholder.typicode.com/todos/1'
    respuesta       = requests.get(url)
    respuesta_json  = respuesta.json()

    print('v1')

    return {
        'statusCode': 200,
        'body': json.dumps(respuesta_json)
    }