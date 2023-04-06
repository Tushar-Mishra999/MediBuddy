import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/controller/auth-service.dart';
import 'rounded_button.dart';
import 'customtextfield.dart';
import 'package:geolocator/geolocator.dart';

class SellerRegistration extends StatefulWidget {
  const SellerRegistration({super.key});
  static const String routeName = '/sellerregistration-screen';

  @override
  State<SellerRegistration> createState() => _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {
  bool homeopathy = false;
  bool allopathy = false;
  bool ayurvedic = false;
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final cityController = TextEditingController();

  final contactController = TextEditingController();

  final addressController = TextEditingController();

  Future<void> registerSeller({
    required String name,
    required String email,
    required String password,
    required String city,
    required String contact,
    required String address,
    required BuildContext context,
    required String coordinates,
    required String shopTimings,
    required List<String> categories,
  }) async {
    Authservice authservice = Authservice();
    await authservice.registerSeller(
        name: name,
        email: email,
        password: password,
        city: city,
        contact: contact,
        address: address,
        context: context,
        shopTimings: shopTimings,
        coordinates: coordinates,
        categories:categories
        );
  }

  String? selectedOpeningTime;
  String? selectedClosingTime;

  Future<void> selectOpeningTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedOpeningTime = DateFormat('hh:mm a')
          .format(DateTime(2022, 01, 01, pickedTime.hour, pickedTime.minute))
          .toString();
      setState(() {});
      return;
    }
    Fluttertoast.showToast(
        msg: "Please select opening time", backgroundColor: color1);
  }

  Future<void> selectClosingTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedClosingTime = DateFormat('hh:mm a')
          .format(DateTime(2022, 01, 01, pickedTime.hour, pickedTime.minute))
          .toString();
      setState(() {});
      return;
    }
    Fluttertoast.showToast(
        msg: "Please select opening time", backgroundColor: color1);
  }

  Position? currentPosition;

  Future<void> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      currentPosition = position;
      setState(() {});
    } catch (e) {
      Fluttertoast.showToast(
          msg: " $e Please pick your current location",
          backgroundColor: color1);
    }
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
            child: Column(children: [
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
              GestureDetector(
                onTap: () {
                  selectOpeningTime(context);
                },
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      selectedOpeningTime ?? 'Select opening time',
                      style: const TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  selectClosingTime(context);
                },
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      selectedClosingTime ?? 'Select closing time',
                      style: const TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  getCurrentLocation();
                },
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      currentPosition==null? 'Location':currentPosition.toString(),
                      style: const TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  const Text(
                    "Select your medicine Categories:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'GilroyLight',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CheckboxListTile(
                    activeColor: color1,
                    title: const Text(
                      "Homeopathy",
                      style: TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: homeopathy,
                    onChanged: (value) {
                      setState(() {
                        homeopathy = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: color1,
                    title: const Text(
                      "Allopathy",
                      style: TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: allopathy,
                    onChanged: (value) {
                      setState(() {
                        allopathy = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: color1,
                    title: const Text(
                      "Ayurvedic",
                      style: TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: ayurvedic,
                    onChanged: (value) {
                      setState(() {
                        ayurvedic = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedButton(
                  size: size,
                  title: 'REGISTER',
                  onTap: () {
                    List<String> categories = [];
                    if (allopathy) {
                      categories.add('Allopathy');
                    }
                    if (homeopathy) {
                      categories.add('Homeopathy');
                    }
                    if (ayurvedic) {
                      categories.add('Ayurveic');
                    }
                    String shopTimings =
                        selectedOpeningTime! + ' - ' + selectedClosingTime!;
                    registerSeller(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        city: cityController.text,
                        address: addressController.text,
                        contact: contactController.text,
                        shopTimings: shopTimings,
                        context: context,
                        coordinates: currentPosition.toString(),
                        categories:categories);
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
