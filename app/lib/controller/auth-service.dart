import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/models/user.dart';
import 'package:medibuddy/views/home/client.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/seller/inventory_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/user-provider.dart';

class Authservice {
  Future<void> registerClient(
      {required String name,
      required String email,
      required String password,
      required String city,
      required BuildContext context}) async {
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'city': city
    };
    final response = await http.post(
      Uri.parse('$ip/client/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (response.statusCode == 400) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      // Registration failed
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
    }
  }

  Future<void> registerSeller(
      {required String name,
      required String email,
      required String password,
      required String city,
      required String address,
      required String contact,
      required String shopTimings,
      required String coordinates,
      required List<String> categories,
      required BuildContext context}) async {
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'city': city,
      'address': address,
      'phoneNumber': contact,
      'shopTimings': shopTimings,
      'coordinates': coordinates,
      'category': categories
    };

    final response = await http.post(
      Uri.parse('$ip/seller/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (response.statusCode == 400) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      // Registration failed
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
    }
  }

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final body = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('$ip/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      // ignore: use_build_context_synchronously
      Provider.of<UserProvider>(context, listen: false)
          .setUser(json.decode(response.body));
      final user = Provider.of<UserProvider>(context, listen: false).user;
      prefs.setBool('isLoggedIn', true);
      prefs.setString(
          'name',user.name
        );
        prefs.setString(
          'email',user.email
        );
        prefs.setString(
          'city',user.city
        );
      if (Provider.of<UserProvider>(context, listen: false).user.type ==
          'client') {
        prefs.setString('type', 'client');
        Navigator.pushReplacementNamed(context, ClientHomeScreen.routeName);
      } else {
        prefs.setString("type", 'seller');
        Navigator.pushReplacementNamed(context, InventoryScreen.routeName);
      }
    } else if (response.statusCode == 400) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
    } else {
      // Registration failed

      Fluttertoast.showToast(
          msg: "Something went wrong, please try again ${response.statusCode}",
          backgroundColor: color1,
          textColor: Colors.white);
    }
  }
}
