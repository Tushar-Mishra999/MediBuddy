import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/models/medicine.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:provider/provider.dart';

class SellerService {
  Future<void> addMedicine(
      {required String medicineName,
      required String salt,
      required String company,
      required String price,
      required String quantity,
      required String description,
      required BuildContext context}) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    final body = {
      "medicineName": medicineName,
      "email": user.email,
      "salt": salt,
      "company": company,
      "price": price,
      "quantity": quantity,
      "description": description
    };


    final response = await http.post(
      Uri.parse('$ip/addmedicine'),
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

  Future<void> updateMedicine(
      {required String id,
      required String medicineName,
      required String salt,
      required String company,
      required String price,
      required String quantity,
      required String description,
      required BuildContext context}) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    final body = {
      'id': id,
      "medicineName": medicineName,
      "email": user.email,
      "salt": salt,
      "company": company,
      "price": price,
      "quantity": quantity,
      "description": description
    };

    final response = await http.post(
      Uri.parse('$ip/updatemedicine'),
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

  Future<List<Medicine>> getMedicine({required BuildContext context}) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    final response =
        await http.get(Uri.parse('$ip/getmedicine?email=${user.email}'));

    if (response.statusCode == 200) {
      final List<dynamic> medicinesJson =
          json.decode(response.body)["medicineList"];
      final List<Medicine> medicines =
          medicinesJson.map((medicine) => Medicine.fromMap(medicine)).toList();
      return medicines;
    } else if (response.statusCode == 400 || response.statusCode == 500) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      return [];
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
      return [];
    }
  }

  Future<bool> changeStatus(BuildContext context, bool status) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    final body = {"email": user.email, "status": status};

    final response = await http.post(
      Uri.parse('$ip/changestatus'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      return status;
    } else if (response.statusCode == 400 || response.statusCode == 500) {
      var message = json.decode(response.body)['msg'];
      Fluttertoast.showToast(
          msg: message, backgroundColor: color1, textColor: Colors.white);
      return !status;
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong, please try again",
          backgroundColor: color1,
          textColor: Colors.white);
      return !status;
    }
  }

  Future<void> deleteMedicine(
      {required String id, required BuildContext context}) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    final response = await http.delete(
      Uri.parse("$ip/deletemedicine"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'email': user.email}),
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: json.decode(response.body)['msg'],
          backgroundColor: color1,
          textColor: Colors.white);
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
