import { DynamoDBClient, PutItemCommand } from '@aws-sdk/client-dynamodb';


const insertarProducto = async (producto) => {

    const entrada = {
        Item: {
          ID: {
            N: producto.id.toString()
          },
          Nombre: {
            S: producto.nombre
          },
          Precio: {
            N: producto.precio.toString()
          }
        },
        TableName: process.env.TABLA_PRODUCTO
    };

    const cliente = new DynamoDBClient();
    const comando = new PutItemCommand(entrada);
    return await cliente.send(comando);
}


export const handler = async (event) => {

    const body      = JSON.parse(event.body);
    console.log(body);

    const respuesta = await insertarProducto( body );
    console.log(respuesta);

    return {
        statusCode: 200,
        body: JSON.stringify({
            estado: "exitoso"
        })
    };
};
