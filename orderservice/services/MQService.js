var amqp = require('amqplib/callback_api');

amqp.connect('amqp://localhost', function (error0, connection) {
    if (error0) {
        throw error0;
    }
    connection.createChannel(function (error1, channel) {
        if (error1) {
            throw error1;
        }
        var queue = 'orders';

        channel.assertQueue(queue, {
            durable: false
        });

        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);
        channel.consume(queue, function (msg) {
            let decoded_data = JSON.parse(msg.content.toString())
            console.log(" [ORDERS] Received.");
            console.log(decoded_data);
            console.log("-------------------");
        }, {
            noAck: true
        })
    });
});
