import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/router.dart';
import 'package:medibuddy/views/chat/chat_screen.dart';
import 'package:medibuddy/views/details/store_details.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() async{
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
      home: ChatScreen(chatRoomId: 'dg325@snu.edu.in:tusharmishra16@gmail.com',),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
