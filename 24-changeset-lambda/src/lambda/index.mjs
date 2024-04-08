export const handler = async (event) => {
    
    console.log('Hola Mundo!');
    
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hola Mundo!'),
    };
    
    return response;
};