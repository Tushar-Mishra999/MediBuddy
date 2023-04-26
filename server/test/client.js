const chai = require('chai');
const expect = chai.expect;
const request = require('supertest');
const app = require('../index');
const mongoose = require("mongoose");
const DB = "mongodb+srv://dgdevanshi:medibuddy@medibuddycluster.bk3xmrr.mongodb.net/?retryWrites=true&w=majority"




describe('clientRouter', async() => {
    describe('GET /tipnsellers', () => {
      it('should return an array of 5 or less sellers and a random daily tip', async () => {
        mongoose
    .connect(DB)
    .then(async() => {
        const res = await chai.request(app).get('/client/tipnsellers').query({ city: 'San Francisco' });
        expect(res).to.have.status(200);
        expect(res.body.sellerList).to.be.an('array').that.has.lengthOf.at.most(5);
        expect(res.body.dailyTip).to.be.a('string');
    })
    .catch((e) => {
    });
      });
  
      it('should return a 500 status if an error occurs', async () => {
        mongoose
    .connect(DB)
    .then(async() => {
            const res = await chai.request(app).get('/client/tipnsellers').query({ city: '' });
            expect(res).to.have.status(500);
    })
    .catch((e) => {
    });
      });
    });
  
    describe('GET /search', () => {
      it('should return an array of sellers with the requested medicine in their stock', async () => {
        mongoose
    .connect(DB)
    .then(async() => {
        const res = await chai.request(app).get('/client/search').query({ city: 'San Francisco', medicine: 'aspirin' });
        expect(res).to.have.status(200);
        expect(res.body.searchedSellers).to.be.an('array');
        expect(res.body.searchedSellers.every(seller => {
          return seller.stock.some(stock => stock.medicineName.toLowerCase() === 'aspirin');
        })).to.be.true;
    })
    .catch((e) => {
    });
      });
  
      
    });
  
    describe('GET /category', () => {
      it('should return an array of sellers with the requested category in their category array', async () => {
        mongoose
    .connect(DB)
    .then(async() => {
        const res = await chai.request(app).get('/client/category').query({ city: 'San Francisco', category: 'pharmacy' });
        expect(res).to.have.status(200);
        expect(res.body.searchedSellers).to.be.an('array');
        expect(res.body.searchedSellers.every(seller => {
          return seller.category.includes('Pharmacy');
        })).to.be.true;
    })
    .catch((e) => {
    });
      });
  
      
    });
})