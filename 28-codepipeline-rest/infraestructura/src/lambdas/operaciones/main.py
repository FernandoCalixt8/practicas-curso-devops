import json
from casos_uso.suma import suma
from casos_uso.resta import resta

def lambda_handler(event, context):
    # path parameters
    parametros      = event['pathParameters']
    parametro_1     = int(parametros['parametro1'])
    parametro_2     = int(parametros['parametro2'])

    # operaciones
    resultado_suma  = suma(parametro_1, parametro_2)
    resultado_resta = resta(parametro_1, parametro_2)
    print(resultado_suma)
    print(resultado_resta)

    response = {
        'statusCode': 200,
        'body': json.dumps({
            'suma': resultado_suma,
            'resta': resultado_resta
        })
    }

    return response