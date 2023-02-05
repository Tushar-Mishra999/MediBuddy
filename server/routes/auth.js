const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();

// SIGN IN
authRouter.post("/signin", async (req, res) => {
    try {
      const { email, password } = req.body;
  
      const client = await Client.findOne({ email });
      const seller = await Seller.findOne({ email });
      const user=client;
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

     
      const isMatch = await bcryptjs.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect password." });
      }
  
      //const token = jwt.sign({ id: user._id }, "passwordKey");
      res.json({ msg:"Login successful", ...user._doc });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

module.exports = authRouter;