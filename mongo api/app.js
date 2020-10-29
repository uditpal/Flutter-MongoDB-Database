const express=require('express')
const mongoose=require('mongoose')
const url='MongoDB URL will come here'
const app=express()

mongoose.connect(url,{ useNewUrlParser: true,useUnifiedTopology: true })

const con=mongoose.connection

con.on('open',function(){
    console.log('Mongo connected......')
})

app.use(express.json())


const alienRouter = require('./routes/aliens.js')

app.use('/detail',alienRouter)


app.listen(4000,()=>{
    console.log('Get started')
})

