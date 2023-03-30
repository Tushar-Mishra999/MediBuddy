import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';

import '../registration/customtextfield.dart';
import '../registration/rounded_button.dart';

class UpdateMedicine extends StatelessWidget {
  UpdateMedicine({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Crocin');
  final stockController = TextEditingController(text: '30');
  final descriptionController =
      TextEditingController(text: 'This is mast eat it fast');
  final companyController = TextEditingController(text: 'Dr. Reddy');
  final priceController = TextEditingController(text: '30.99');
  final saltController = TextEditingController(text: 'Anithistamine benzene');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: color1,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Update",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: " Stock",
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
                height: size.height * 0.02,
              ),
              CustomTextField(
                title: "Name",
                controller: nameController,
                hintText: "Enter medicine name",
                edit: true,
              ),
              CustomTextField(
                title: "Company",
                controller: companyController,
                hintText: "Enter company name",
                edit: true,
              ),
              CustomTextField(
                title: "Description",
                controller: descriptionController,
                hintText: "Enter medicine's description",
                edit: true,
              ),
              CustomTextField(
                title: "Salt",
                controller: saltController,
                hintText: "Enter medicine's salt",
                edit: true,
              ),
              CustomTextField(
                title: "Stock",
                controller: stockController,
                hintText: "Enter quantity",
                edit: true,
              ),
              CustomTextField(
                title: "Price",
                controller: priceController,
                hintText: "Enter price",
                edit: true,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              //RoundedButton(size: size, title: 'UPDATE'),
            ]),
          ),
        ),
      ),
    );
  }
}
