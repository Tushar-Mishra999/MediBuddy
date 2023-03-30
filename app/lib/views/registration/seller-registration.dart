import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/registration/services/auth-service.dart';
import 'rounded_button.dart';
import 'customtextfield.dart';

class SellerRegistration extends StatelessWidget {
  SellerRegistration({super.key});
  static const String routeName = '/sellerregistration-screen';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cityController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();

  Future<void> registerSeller(
      {required String name,
      required String email,
      required String password,
      required String city,required String contact,required String address,required BuildContext context}) async {
    Authservice authservice = Authservice();
    await authservice.registerSeller(
        name: name, email: email, password: password, city: city,contact: contact,address: address,context: context);
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
                    text: "Seller ",
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextField(
                title: "Store Name",
                controller: nameController,
                hintText: "Enter your store name",
              ),
              CustomTextField(
                title: "Email",
                controller: emailController,
                hintText: "Enter your email",
              ),
              CustomTextField(
                title: "Password",
                obscure: true,
                controller: passwordController,
                hintText: "Enter your password",
              ),
              CustomTextField(
                title: "Address",
                controller: addressController,
                hintText: "Enter your address",
              ),
              CustomTextField(
                title: "City",
                controller: cityController,
                hintText: "Enter your city",
              ),
              CustomTextField(
                title: "Contact ",
                controller: contactController,
                hintText: "Enter your contact number",
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedButton(
                  size: size,
                  title: 'REGISTER',
                  onTap: () {
                    registerSeller(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        city: cityController.text,
                        address: addressController.text,
                        contact: contactController.text,
                        context: context);
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
