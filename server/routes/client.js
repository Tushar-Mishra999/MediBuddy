const { query, response } = require("express");
const express = require("express");
const Client = require("../models/client");
const DailyTip = require("../models/dailytip");
const Seller = require("../models/seller");

const clientRouter = express.Router();

clientRouter.get("/tipnsellers", async(req, res) => {
    const city = req.query.city;
    const sellers = await Seller.find({city});
    limit = 5;
    let sellerArray = sellers.map((seller) => seller.toObject());
    if (sellerArray.length < 5) {
        sellerArray = sellerArray;
    } else {
        sellerArray = sellerArray.slice(0, limit);
    }
    const dailytips = await DailyTip.find({});
    const dailytipsArray = dailytips.map((dailytip) => dailytip.content);
    const randomIndex = Math.floor(Math.random() * dailytipsArray.length);
    const randomTip = dailytipsArray[randomIndex];

-    res.json({"sellerList": sellerArray, "dailyTip": randomTip});
});

clientRouter.post("/search", async(req, res) => {
    const city = req.body.city;
    const medicineName = req.query.medicine;
    const sellers = await Seller.find({});
    let citySellers = sellers.filter(seller => seller.city === city);
    let otherSellers = sellers.filter(seller => seller.city !== city);
    const searchedSellers = [];
    for (let i= 0; i<citySellers.length;i++) {
        let seller=citySellers[i];
        for (let j=0; j<seller.stock.length; j++) {   
            if(medicineName === seller.stock[j].medicineName) {
                searchedSellers.push(seller);
            }
        }    
    }

    for (let i= 0; i<otherSellers.length;i++) {
        let seller=otherSellers[i];
        for (let j=0; j<seller.stock.length; j++) {   
            if(medicineName === seller.stock[j].medicineName) {
                searchedSellers.push(seller);
            }
        }    
    }
    res.json({searchedSellers});
});


module.exports = clientRouter;