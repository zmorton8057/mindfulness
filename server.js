const express = require('express');
const app = express();
const connection = require('./models/connection.js')
const orm = require('./models/orm.js')

// middleware
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
let PORT = 3000||process.env.PORT;
// connection to db
connection.connect()
orm.findMantraByEmotion('love',(data)=>{
    console.log(data.rows)
})





app.get('/', function (req, res) {
   res.send('Hello World');
})



app.listen(PORT, function () {   
   console.log("Example app listening at http://%s", PORT)
})