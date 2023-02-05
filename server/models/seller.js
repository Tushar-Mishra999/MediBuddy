const mongoose = require("mongoose");

const sellerSchema = mongoose.Schema({
  storeName: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  city: {
    type: String,
    required:true
  },
  address: {
    type: String,
    required: true
  },
  phoneNumber: {
    type: Number,
    required: true
  },
  stock: [
    {
      medicine: medicineSchema,
      quantity: {
        type: Number,
        required: true,
      }
    }
  ]
});

const Seller = mongoose.model("Seller", sellerSchema);
module.exports = Seller;