import { DynamoDBClient, GetItemCommand } from '@aws-sdk/client-dynamodb';


const obtenerProducto = async (idProducto) => {

    const entrada = {
        Key: {
            ID: {
                N: idProducto
            }
        },
        TableName: process.env.TABLA_PRODUCTO
    }

    const cliente   = new DynamoDBClient();
    const comando   = new GetItemCommand(entrada);
    return await cliente.send(comando);
}


export const handler = async (event) => {
        
    const id    = event.pathParameters.id;
    console.log(id);

    const respuesta   = await obtenerProducto(id);
    console.log(respuesta);

    return {
        statusCode: 200,
        body: JSON.stringify({
            id:     Number(respuesta.Item.ID.N),
            nombre: respuesta.Item.Nombre.S,
            precio: Number(respuesta.Item.Precio.N)
        })
    };
};