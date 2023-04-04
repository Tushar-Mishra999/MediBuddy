const express = require("express");
const Seller = require("../models/seller");
const {Medicine} = require("../models/medicine");

const sellerRouter=express.Router();

sellerRouter.post('/addmedicine', async (req, res) => {
    const {email, medicineName, salt, company, price, quantity, description} = req.body;
    const seller = await Seller.findOne({email});
    for (const medicine of seller.stock) {
      if (medicine.medicineName === medicineName) {
        return res.status(400).json({msg:"Same medicine exists in inventory"});
      } 
    }

    let medicine= new Medicine({medicineName, salt, company, price, quantity, description});
    await medicine.save();

    seller.stock.push(medicine);
    await seller.save();
    res.json({msg:'Medicine added successfully'});
})


sellerRouter.get("/getmedicine",async (req,res)=>{
    const email=req.query.email;
    const seller=await Seller.findOne({email:email});
    const medicineList=seller.stock;
    console.log(medicineList);
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
    const {email,id, medicineName, salt, company, price, quantity, description} = req.body;
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

sellerRouter.delete('/deletemedicine', async (req, res) => {
    const { id,email } = req.body;
    try {
      const medicine = await Medicine.findById(id);
      if (!medicine) {
        return res.status(400).json({ msg: 'Medicine not found' });
      }
      await medicine.remove();
  
      const seller = await Seller.findOne({ email: email });
      if (seller) {
        seller.stock = seller.stock.filter((medicine) => medicine._id.toString() !== id);
        await seller.save();
      }
      res.json({ msg: 'Medicine deleted successfully' });
    } catch (err) {
      console.error(err);
      res.status(500).send('Server Error');
    }
  });

module.exports= sellerRouter;