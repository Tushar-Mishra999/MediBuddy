const mongoose = require("mongoose");
const {medicineSchema}=require("./medicine");
const Client = require("./client");

const sellerSchema = mongoose.Schema({
  name: {
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
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Password should have atleast 6 characters",
    }
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
  shopTimings: {
    type: String,
    required: true
  },
  category: [String],
  stock: [medicineSchema],
  coordinates:{
      type:String,
      required:true
  },
  reviews:
    {
      avg:{
        type:Number,
        default:0
      },
      ratings:[
        {email:{type:String}, rating:{type:Number}}
      ]
    }
  , 
  status:{
    type:Boolean,
    default: false
  }
});

const Seller = mongoose.model("Seller", sellerSchema);
module.exports = Seller;