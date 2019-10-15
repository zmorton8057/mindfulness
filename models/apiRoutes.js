require('dotenv').config()
var express = require('express')
var router = express.Router();
const connection = require('./connection.js')
const orm = require('./orm.js')

let PORT = 3000||process.env.PORT;
// connection to db


// pass in primary and secondary emotions to get tertiary emotions and definitions
router.get('/mood/:primary?/:secondary?', function (req, res) {
  if(req.params.primary && req.params.secondary){
  let primaryEmotion = req.params.primary;
  let secondaryEmotion = req.params.secondary;
  orm.getTertiaryEmotions(primaryEmotion,secondaryEmotion,(data)=>{
    // console.log(data.rows)
     res.json(data.rows) 
 })
}else if(req.params.primary){
  let primaryEmotion = req.params.primary;
  orm.getSecondaryEmotions(primaryEmotion,(data)=>{
    // console.log(data.rows)
     res.json(data.rows)
  });
}else{
  orm.getAllPrimaryEmotions((data)=>{
    // console.log(data.rows)
     res.json(data.rows)
 });
}
});





module.exports = router;