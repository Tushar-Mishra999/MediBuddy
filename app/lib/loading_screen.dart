import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/views/home/client.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/seller/inventory_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String type = prefs.getString('type') ?? 'client';
    String name = prefs.getString('name') ?? '';
    String email = prefs.getString('email') ?? '';
    String city = prefs.getString('city') ?? '';

    Provider.of<UserProvider>(context, listen: false)
        .setUser({'name': name, 'city': city, 'type': type, 'email': email});
    _timer = Timer(const Duration(seconds: 1), () {
      if (isLoggedIn) {
        if (type == 'client') {
          Navigator.pushNamedAndRemoveUntil(
              context, ClientHomeScreen.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, InventoryScreen.routeName, (route) => false);
        }
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, OnboardingScreen.routeName, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.orange.shade800,
      )),
    );
  }
}
