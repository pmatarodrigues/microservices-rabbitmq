var amqp = require('amqplib/callback_api');
var connectToDB = require('./DBService');

amqp.connect('amqp://localhost', function (error0, connection) {
    if (error0) {
        throw error0;
    }
    connection.createChannel(function (error1, channel) {
        if (error1) {
            throw error1;
        }
        var queue = 'messaging';

        channel.assertQueue(queue, {
            durable: false
        });

        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);
        channel.consume(queue, function (msg) {
            let decoded_data = JSON.parse(msg.content.toString())
            console.log(" [MESSAGING] Received.");
            console.log(decoded_data);
            console.log("-------------------");

            connectToDB(queue, async (collection) => {
                const options = { ordered: true };
                const result = await collection.insertMany(decoded_data, options)
                console.log(`${result.insertedCount} documents were inserted`);
            })
        }, {
            noAck: true
        })
    });
});
