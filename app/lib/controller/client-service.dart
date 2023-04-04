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
}
