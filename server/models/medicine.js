const mongoose = require("mongoose");

const medicineSchema = mongoose.Schema({
    medicineName: {
        required: true,
        type: String,
        trim: true
    },
    salt: {
        required: true,
        type: String,
        trim: true
    },
    company: {
        required: false,
        type: String,
        trim: true
    },
    price: {
        required: true,
        type: Number,
        trim: true
    },
    quantity: {
        required: true,
        type: Number,
        trim: true
    },
    description: {
        required: false,
        type: String,
        trim: true
    }
});

const Medicine = mongoose.model("Medicine", medicineSchema);
module.exports = Medicine;