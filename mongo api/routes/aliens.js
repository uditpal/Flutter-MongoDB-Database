const express=require('express')
const router=express.Router()
const Alien=require('../models/alien.js')

router.get('/',async (req,res)=>{
    try{
        const aliens=await Alien.find()
        res.json(aliens)
    }catch(err){
        res.send('Error show'+err)
    }
})

router.get('/:id',async (req,res)=>{
    try{
        const alien=await Alien.findById(req.params.id)
        res.json(alien)
    }catch(err){
        res.send('Error'+err)
    }
})

router.post('/',async (req, res)=>{
    const alien=new Alien({
        Age:req.body.Age,
        Gender:req.body.Gender,
        Symptom:req.body.Symptom,
        Person:req.body.Person,
        Place:req.body.Place,
        History:req.body.History,
    })

    try{
        const a1=await alien.save()
        res.json(a1)
    }catch(err){
        res.send('Error is there')
    }
})

router.delete('/:id',async (req,res)=>{
    try{
        const alien=await Alien.findById(req.params.id)
        const a1=await alien.delete()
        res.json(alien)
    }catch(err){
        res.send('Error'+err)
    }
})


module.exports=router