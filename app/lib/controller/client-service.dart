import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medibuddy/constants.dart';
import 'package:provider/provider.dart';

import '../models/seller.dart';
import '../provider/user-provider.dart';

class ClientService {
  Future<Map<String, dynamic>> getSellers(
      {required BuildContext context}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final response =
        await http.get(Uri.parse('$ip/tipnsellers?city=${user.city}'));

    if (response.statusCode == 200) {
      final List<dynamic> sellerJsonList =
          json.decode(response.body)['sellerList'];
      final String dailytip = json.decode(response.body)['dailyTip'];
      final List<Seller> sellerList = sellerJsonList
          .map((sellerJson) => Seller.fromMap(sellerJson))
          .toList();
      return {'sellers': sellerList, 'dailyTip': dailytip};
    } else if (response.statusCode == 400 || response.statusCode == 500) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      return {};
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
      return {};
    }
  }

  Future<List<Seller>> searchResult(
      {required BuildContext context, required String medicine}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final response = await http
        .get(Uri.parse('$ip/search?city=${user.city}&medicine=$medicine'));

    if (response.statusCode == 200) {
      final List<dynamic> sellerJsonList =
          json.decode(response.body)['searchedSellers'];
      final List<Seller> sellerList = sellerJsonList
          .map((sellerJson) => Seller.fromMap(sellerJson))
          .toList();
      return sellerList;
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
      return [];
    }
  }

  Future<List<Seller>> categoryResult(
      {required BuildContext context, required String category}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final response = await http
        .get(Uri.parse('$ip/category?city=${user.city}&category=$category'));

    if (response.statusCode == 200) {
      final List<dynamic> sellerJsonList =
          json.decode(response.body)['searchedSellers'];
      final List<Seller> sellerList = sellerJsonList
          .map((sellerJson) => Seller.fromMap(sellerJson))
          .toList();
      return sellerList;
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
      return [];
    }
  }

  Future<void> addRating(
      {required double rating,
      required String sellerEmail,
      required BuildContext context}) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;

    final body = {
      "rating": rating,
      "email": sellerEmail,
    };

    final response = await http.post(
      Uri.parse('$ip/review?email=${user.email}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else if (response.statusCode == 400 || response.statusCode == 500) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
    }
  }
}
