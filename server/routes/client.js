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

clientRouter.get("/search", async(req, res) => {
    const city = req.query.city;
    const medicineName = req.query.medicine;
    const sellers = await Seller.find({});
    let citySellers = sellers.filter(seller => seller.city === city);
    let otherSellers = sellers.filter(seller => seller.city !== city);
    const searchedSellers = [];
    for (let i= 0; i<citySellers.length;i++) {
        let seller=citySellers[i];
        for (let j=0; j<seller.stock.length; j++) {   
            if(medicineName.toLowerCase() === seller.stock[j].medicineName.toLowerCase()) {
                searchedSellers.push(seller);
            }
        }    
    }
    for (let i= 0; i<otherSellers.length;i++) {
        let seller=otherSellers[i];
        for (let j=0; j<seller.stock.length; j++) {   
            if(medicineName.toLowerCase() === seller.stock[j].medicineName.toLowerCase()) {
                searchedSellers.push(seller);
            }
        }    
    }
    res.json({searchedSellers});
});

clientRouter.get("/category", async(req, res) => {
    const city = req.query.city;
    const category = req.query.category;
    const sellers = await Seller.find({});
    let citySellers = sellers.filter(seller => seller.city === city);
    let otherSellers = sellers.filter(seller => seller.city !== city);
    const searchedSellers = [];
    for (let i= 0; i<citySellers.length;i++) {
        let seller=citySellers[i];
        for (let j=0; j<seller.category.length; j++) {   
            if (category.toLowerCase() === seller.category[j].toLowerCase()) {
                searchedSellers.push(seller);
            }
        }
    }

    for (let i= 0; i<otherSellers.length;i++) {
        let seller=otherSellers[i];
        for (let j=0; j<seller.category.length; j++) {   
            if(category.toLowerCase() === seller.category[j].toLowerCase()) {
                searchedSellers.push(seller);
            }
        }    
    }
    res.json({searchedSellers});
});

clientRouter.post('/review', async (req, res) => {
    let clientEmail = req.query.email;
    const {rating, email} = req.body;//seller's email, and rating score
    const seller = await Seller.findOne({email});
    let ratings = seller.reviews["ratings"];

    const index = ratings.findIndex(obj => obj.email === clientEmail);
    if(index !== -1) {
        ratings[index]["rating"] = rating;
    } else {
        ratings.push({"email": clientEmail, "rating": rating})
    }


    let avg=0;
    console.log(ratings);
    for (let i=0;i<ratings.length;i++) {
        avg+=ratings[i]['rating'];
        console.log(avg);
    }
    avg/=ratings.length;
    seller.reviews["avg"] = avg;
    seller.reviews["ratings"]=ratings;
    await seller.save();
    res.json({msg: "Review added successfully"});
});

module.exports = clientRouter;