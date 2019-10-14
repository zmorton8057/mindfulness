require('dotenv').config()
var express = require('express')
var router = express.Router();
const connection = require('./connection.js')
const orm = require('./orm.js')

let PORT = 3000||process.env.PORT;
// connection to db

// gets all 6 primary emotions for use
router.get('/getAllPrimary', function (req, res) {
   orm.getAllPrimaryEmotions((data)=>{
     console.log(data.rows)
      res.json(data.rows)
  })
});
// pass in primary emotion as a parameter to receive all secondary emotions and definitions under it
router.get('/getSecondary/:primary', function (req, res) {
  let primaryEmotion = req.params.primary;
  orm.getSecondaryEmotions(primaryEmotion,(data)=>{
    console.log(data.rows)
     res.json(data.rows)
 })
});
// pass in primary and secondary emotions to get tertiary emotions and definitions
router.get('/getTertiary/:primary/:secondary', function (req, res) {
  let primaryEmotion = req.params.primary;
  let secondaryEmotion = req.params.secondary;
  orm.getTertiaryEmotions(primaryEmotion,secondaryEmotion,(data)=>{
    console.log(data.rows)
     res.json(data.rows)
 })
});





module.exports = router;