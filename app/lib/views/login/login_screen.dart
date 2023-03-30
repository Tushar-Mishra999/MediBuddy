import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';

import '../registration/customtextfield.dart';
import '../registration/rounded_button.dart';
import '../registration/services/auth-service.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Authservice authservice = Authservice();
    await authservice.login(email: email, password: password, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: color1,
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Sign ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: "In",
                    style: TextStyle(
                      color: color1,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              CustomTextField(
                title: "Email",
                controller: emailController,
                hintText: "Enter your email",
              ),
              CustomTextField(
                title: "Password",
                controller: passwordController,
                hintText: "Enter your password",
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedButton(
                size: size,
                title: 'LOGIN',
                onTap: () {
                  signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
