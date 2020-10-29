const mongoose=require('mongoose')

const alienSchema=new mongoose.Schema({
    Age:{
        type:String
    },
    Gender:{
        type:String
    },
    Symptom:{
        type:[String]
    },
    Person:{
        type:String
    },
    Place:{
        type:String
    },
    History:{
        type:String
    },
})

module.exports=mongoose.model('Detail',alienSchema)