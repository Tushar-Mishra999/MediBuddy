const mongoose = require("mongoose");

const dailytipSchema = mongoose.Schema({
  content: {
    required: true,
    type: String,
    trim: true,
  },
});

const DailyTip = mongoose.model("DailyTip", dailytipSchema);
module.exports = DailyTip;