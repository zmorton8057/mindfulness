var express = require('express');
var app = express();
var connection = require('./models/connection.js')

// middleware
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
let PORT = 3000||process.env.PORT;
connection.connect(
connection.query('select * from mantras',function(err,response){
    console.log(response.rows);
})
);



app.get('/', function (req, res) {
   res.send('Hello World');
})



app.listen(PORT, function () {   
   console.log("Example app listening at http://%s", PORT)
})