import 'package:flutter/material.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/router.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context)=>UserProvider())],
    child: const MyApp()));
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
      home: SellerRegistration(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
