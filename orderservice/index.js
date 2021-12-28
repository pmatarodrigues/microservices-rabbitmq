const express = require('express')
const bodyParser = require('body-parser');
const app = express()
const port = 3001

var amqpfunctions = require('./services/MQService')

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})

