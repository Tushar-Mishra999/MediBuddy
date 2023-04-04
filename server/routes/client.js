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

    res.json({"sellerList": sellerArray, "dailyTip": randomTip});
});

module.exports = clientRouter;
