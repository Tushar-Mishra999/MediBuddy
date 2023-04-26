const chai = require('chai');
const expect = chai.expect;
const app = require('../index');
const mongoose = require("mongoose");
const DB = "mongodb+srv://dgdevanshi:medibuddy@medibuddycluster.bk3xmrr.mongodb.net/?retryWrites=true&w=majority"
const Seller = require("../models/seller");


describe("sellerRouter", () => {

  describe("POST /addmedicine", () => {
    it("should add a new medicine to seller's stock", async () => {
        mongoose
        .connect(DB)
        .then(async() => {
            const email = "seller1@example.com";
          const medicineName = "Paracetamol";
          const salt = "Acetaminophen";
          const company = "ABC Pharmaceuticals";
          const price = 10.50;
          const quantity = 50;
          const description = "For fever and pain relief";
    
          const seller = new Seller({
            name: "Seller 1",
            email: email,
            password: "password",
            phone: "9876543210",
            address: "123, Main Street",
            status: "active"
          });
          await seller.save();
    
          const res = await chai.request(app)
            .post('/seller/addmedicine')
            .send({
              email: email,
              medicineName: medicineName,
              salt: salt,
              company: company,
              price: price,
              quantity: quantity,
              description: description
            });
    
          expect(res.status).to.equal(200);
          expect(res.body.msg).to.equal('Medicine added successfully');
    
          const updatedSeller = await Seller.findOne({email: email});
          expect(updatedSeller.stock.length).to.equal(1);
          expect(updatedSeller.stock[0].medicineName).to.equal(medicineName);
        })
        .catch((e) => {
        });
    });

    it("should return an error if the medicine already exists in seller's stock", async () => {
        mongoose
        .connect(DB)
        .then(async() => {
            const email = "seller2@example.com";
            const medicineName = "Paracetamol";
            const salt = "Acetaminophen";
            const company = "ABC Pharmaceuticals";
            const price = 10.50;
            const quantity = 50;
            const description = "For fever and pain relief";
      
            const seller = new Seller({
              name: "Seller 2",
              email: email,
              password: "password",
              phone: "9876543210",
              address: "123, Main Street",
              status: "active",
              stock: [{
                medicineName: medicineName,
                salt: salt,
                company: company,
                price: price,
                quantity: quantity,
                description: description
              }]
            });
            await seller.save();
      
            const res = await chai.request(app)
              .post('/seller/addmedicine')
              .send({
                email: email,
                medicineName: medicineName,
                salt: "Ibuprofen",
                company: "XYZ Pharmaceuticals",
                price: 15.50,
                quantity: 25,
                description: "For pain relief"
              });
      
            expect(res.status).to.equal(400);
            expect(res.body.msg).to.equal('Same medicine exists in inventory');
      
            const updatedSeller = await Seller.findOne({email: email});
            expect(updatedSeller.stock.length).to.equal(1);
        })
        .catch((e) => {
        });
    });

  });

})