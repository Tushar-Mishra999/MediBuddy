const express = require("express");
const Seller = require("../models/seller");
const Medicine = require("../models/medicine");

sellerRouter.post('/addmedicine', async (req, res) => {
    const {email,medicineName, salt, company, price, quantity, description} = req.Medicine;
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

module.exports= sellerRouter;