import 'package:flutter/material.dart';
import 'package:medibuddy/router.dart';
import 'package:medibuddy/views/home/client.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/registration/client-registration.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';

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
      home: ClientHomeScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
