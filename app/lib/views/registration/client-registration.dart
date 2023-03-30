import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';
import 'package:medibuddy/views/registration/services/auth-service.dart';
import 'rounded_button.dart';
import 'customtextfield.dart';

class ClientRegistration extends StatelessWidget {
  ClientRegistration({super.key});
  static const String routeName = '/clientregistration-screen';
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerClient(
      {required String name,required String email,required String password,required String city, required BuildContext context}) async{
    Authservice authservice = Authservice();
    await authservice.registerClient(name: name, email: email, password: password, city: city,context: context);
  
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
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
                    text: "Client ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: "Details",
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomTextField(
                    title: "Name",
                    controller: nameController,
                    hintText: "Enter your name",
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: emailController,
                    hintText: "Enter your email",
                  ),
                  CustomTextField(
                    title: "Password",
                    controller: passwordController,
                    obscure: true,
                    hintText: "Enter your password",
                  ),
                  CustomTextField(
                    title: "City",
                    controller: cityController,
                    hintText: "Enter your city",
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  RoundedButton(
                    size: size,
                    title: 'REGISTER',
                    onTap: () async{
                      await registerClient(name:nameController.text,password: passwordController.text,email: emailController.text, city: cityController.text,context: context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SellerRegistration.routeName);
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Want to register as a seller? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'GilroyBold',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            TextSpan(
                              text: "Click Here",
                              style: TextStyle(
                                color: color1,
                                fontSize: 15,
                                fontFamily: 'GilroyBold',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
