const connection = require('./connection.js')

const orm = {
// findAllMantras only takes in one input, a callback that allows you to do whatever you want with the data
// it selects the entire mantra table
    findAllMantras : (cb)=>{
        connection.query('select * from mantras',function(err,response){
            if(err) throw err;
            cb(response);
        })
    },
    
    findMantraByEmotion: (emotion,cb)=>{
        connection.query('select * from mantras where primaryEmotion = $1 or secondaryEmotion = $2',[emotion, emotion],function(err,response){
            if(err) throw err;
            cb(response)
        });
    },
}

module.exports=orm;