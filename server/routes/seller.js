const express = require("express");
const Seller = require("../models/seller");
const {Medicine} = require("../models/medicine");

const sellerRouter=express.Router();

sellerRouter.post('/addmedicine', async (req, res) => {
    const {email, medicineName, salt, company, price, quantity, description} = req.body;
    const existingMedicine=await Medicine.findOne({medicineName});

    if(existingMedicine){
        return res.status(400).json({msg:"Same medicine exists in inventory"});
    }

    let medicine= new Medicine({medicineName, salt, company, price, quantity, description});
    await medicine.save();

    const user=await Seller.findOne({email});
    user.stock.push(medicine);
    await user.save();
    res.json({msg:'Medicine added successfully'});
})


sellerRouter.get("/getmedicine",async (req,res)=>{
    const email=req.query.email;
    const seller=await Seller.findOne({email:email});
    const medicineList=seller.stock;
    res.json({medicineList});
})

sellerRouter.post('/changestatus', async(req, res) => {
    const {email, status} = req.body;
    const seller = await Seller.findOne({email});
    seller.status=status;
    await seller.save();
    res.json({msg:"Status changed successfully"});
})

sellerRouter.post('/updatemedicine', async(req, res) => {
    const email = req.query.email;
    const {id, medicineName, salt, company, price, quantity, description} = req.body;
    const seller = await Seller.findOne({email});
    const medicine= await Medicine.findByIdAndUpdate(id,
        {medicineName,
        salt,
        company,
        price,
        quantity,
        description},
        { new: true }
        );
    console.log(medicine);
    seller.stock = seller.stock.filter(medicine => medicine._id.toString() !== id);
    seller.stock.push(medicine);
    await seller.save();
    res.json({msg:"Medicine updated successfully"});
})

module.exports= sellerRouter;