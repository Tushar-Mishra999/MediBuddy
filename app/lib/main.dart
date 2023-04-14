import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/loading_screen.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
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
      home:const LoadingScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
