// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://dgdevanshi:medibuddy@medibuddycluster.bk3xmrr.mongodb.net/?retryWrites=true&w=majority"

const authRouter = require("./routes/auth");
const sellerRouter = require("./routes/seller");
const clientRouter = require("./routes/client");

// middleware
app.use(express.json());
app.use(authRouter);
app.use(sellerRouter);
app.use(clientRouter);

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

module.exports=app;