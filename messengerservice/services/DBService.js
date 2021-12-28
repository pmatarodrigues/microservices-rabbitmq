const { MongoClient } = require("mongodb");

function connectToDB(collectionName, callback) {

    // Connection URI
    const uri = "mongodb://localhost:27017";

    // Create a new MongoClient
    const client = new MongoClient(uri);
    async function run() {
        try {
            // Connect the client to the server
            await client.connect();
            // Establish and verify connection
            const database = await client.db("rabbitmq-ms");
            const collection = database.collection(collectionName)

            // execute function passed by user
            callback(collection);

            console.log("Connected successfully to server");
        } catch (err) {
            // Ensures that the client will close when you finish/error
            await client.close();
        }
    }
    run().catch(console.dir);
}

module.exports = connectToDB