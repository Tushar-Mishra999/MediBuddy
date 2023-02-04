// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// INIT
const PORT = process.env.PORT || 5000;
const app = express();
const DB = "mongodb+srv://dgdevanshi:medibuddy@medibuddycluster.bk3xmrr.mongodb.net/?retryWrites=true&w=majority"

// middleware
app.use(express.json());

// Connections
mongoose.set("strictQuery", false);
mongoose
    .connect(DB)
    .then(() => {
    console.log("Connection Successful");
    })
    .catch((e) => {
    console.log(e);
    });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});