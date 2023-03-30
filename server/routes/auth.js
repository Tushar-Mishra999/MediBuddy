const express = require("express");
const bcryptjs = require("bcryptjs");

const Client = require("../models/client");
const Seller = require("../models/seller");

const authRouter = express.Router();

//SIGNUP - CLIENT
authRouter.post('/client/signup', async (req, res) => {
  const {name, email, password, city} = req.body;
  const existingClient = await Client.findOne({email});
  if (existingClient) {
    return res
      .status(400)
      .json({msg: "Client with same email already exists!"});
  }

  const hashedPassword = await bcryptjs.hash(password, 12);

  let client = new Client({
    name, email, password: hashedPassword, city
  });
  client = await client.save();
  res.json({msg:"Registration successful",client});
});

//SIGNUP - SELLER
authRouter.post('/seller/signup', async(req, res) => {
  const {name, email, password, city, address, phoneNumber} = req.body;
  const existingSeller = await Seller.findOne({email});
  if (existingSeller) {
    return res
      .status(400)
      .json({msg: "Seller with same email already exists!"});
  }

  const hashedPassword = await bcryptjs.hash(password, 12);

  let seller = new Seller({
    name, email, password: hashedPassword, city, address, phoneNumber
  });
  seller = await seller.save();
  res.json({msg:"Registration successful",seller});
});

// SIGN IN
authRouter.post("/signin", async (req, res) => {
    try {
      const { email, password } = req.body;
      const client = await Client.findOne({ email });
      const seller = await Seller.findOne({ email });
      let user=null;
      if (!client&&!seller) {
        return res
          .status(400)
          .json({ msg: "User with this email does not exist!" });
      }
      else if(!client){
        user=seller;
      }
      else{
        user=client;
      }

      // const isMatch = await bcryptjs.compare(password, user.password);
      // if (!isMatch) {
      //   return res.status(400).json({ msg: "Incorrect password" });
      // }
  
      //const token = jwt.sign({ id: user._id }, "passwordKey");
      if(client)
       {return res.json({ msg:"Login successful",type:"client", ...user._doc });}
      
       return res.json({ msg:"Login successful",type:"seller", ...user._doc });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

module.exports = authRouter;