import 'package:flutter/material.dart';
import 'package:medibuddy/router.dart';
import 'package:medibuddy/views/chat/chat_screen.dart';
import 'package:medibuddy/views/details/store_details.dart';
import 'package:medibuddy/views/home/client.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/registration/client-registration.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';
import 'package:medibuddy/views/result/resultscreen.dart';
import 'package:medibuddy/views/seller/add_medicine.dart';
import 'package:medibuddy/views/seller/inventory_screen.dart';
import 'package:medibuddy/views/seller/update_medicine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpdateMedicine(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
