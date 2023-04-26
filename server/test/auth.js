const expect = require('chai').expect;
const request = require('supertest');
const app = require('../index');
const mongoose = require("mongoose");
const DB = "mongodb+srv://dgdevanshi:medibuddy@medibuddycluster.bk3xmrr.mongodb.net/?retryWrites=true&w=majority"

describe('Auth routes', () => {
  describe('POST /client/signup',() => {
   

    it('should register a new client', async () => {
        mongoose
        .connect(DB)
        .then(async () => {
            const res = await request(app)
            .post('/auth/client/signup')
            .send({
              name: 'John Doe',
              email: 'johndoe@example.com',
              password: 'password',
              city: 'New York',
            });
          expect(res.status).to.equal(200);
          expect(res.body.msg).to.equal('Registration successful');
          expect(res.body.client).to.have.property('_id');
          expect(res.body.client.name).to.equal('John Doe');
          expect(res.body.client.email).to.equal('johndoe@example.com');
          expect(res.body.client.city).to.equal('New York');
        })
        .catch((e) => {
        });
      });
      
   
      it('should return an error if client already exists', async () => {
        mongoose
        .connect(DB)
        .then(async() => {
            const res = await request(app)
            .post('/auth/client/signup')
            .send({
              name: 'John Doe',
              email: 'johndoe@example.com',
              password: 'password',
              city: 'New York',
            });
            expect(res.status).to.equal(400);
            expect(res.body.msg).to.equal('Client with same email already exists!');
        })
        .catch((e) => {
        });
      });
   

   
  });

  describe('POST /seller/signup', () => {
    it('should register a new seller', async () => {
        mongoose
        .connect(DB)
        .then(async() => {
          const res = await request(app)
      .post('/auth/seller/signup')
      .send({
        name: 'Jane Doe',
        email: 'janedoe@example.com',
        password: 'password',
        city: 'New York',
        address: '123 Main St',
        phoneNumber: '123-456-7890',
        shopTimings: '9am - 5pm',
        category: 'Clothing',
        coordinates: [40.7128, -74.0060],
      });
    expect(res.status).to.equal(200);
    expect(res.body.msg).to.equal('Registration successful');
    expect(res.body.seller).to.have.property('_id');
    expect(res.body.seller.name).to.equal('Jane Doe');
    expect(res.body.seller.email).to.equal('janedoe@example.com');
    expect(res.body.seller.city).to.equal('New York');
    expect(res.body.seller.address).to.equal('123 Main St');
    expect(res.body.seller.phoneNumber).to.equal('123-456-7890');
    expect(res.body.seller.shopTimings).to.equal('9am - 5pm');
    expect(res.body.seller.category).to.equal('Clothing');
    expect(res.body.seller.coordinates).to.deep.equal([40.7128, -74.0060]);
        })
        .catch((e) => {
        });
    });

    it('should return an error if seller already exists', async () => {
        mongoose
        .connect(DB)
        .then(async() => {
          const res = await request(app)
          .post('/auth/seller/signup')
          .send({
            name: 'Jane Doe',
            email: 'janedoe@example.com',
            password: 'password',
            city: 'New York',
            address: '123 Main St',
            phoneNumber: '123-456-7890',
            shopTimings: '9am - 5pm',
            category: 'Clothing',
            coordinates: [40.7128, -74.0060],})
        })
        .catch((e) => {
        });
        })})
        }
          )



         
          