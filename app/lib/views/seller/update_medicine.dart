import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/controller/seller_service.dart';

import '../registration/customtextfield.dart';
import '../registration/rounded_button.dart';

class UpdateMedicine extends StatefulWidget {
  static const String routeName = "/updatemedicine";
  const UpdateMedicine({
    super.key,
    required this.name,
    required this.quantity,
    required this.description,
    required this.company,
    required this.price,
    required this.salt,
    required this.id,
  });
  final String name;
  final String quantity;
  final String description;
  final String company;
  final String price;
  final String salt;
  final String id;
  @override
  State<UpdateMedicine> createState() => _UpdateMedicineState();
}

class _UpdateMedicineState extends State<UpdateMedicine> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final stockController = TextEditingController();

  final descriptionController = TextEditingController();

  final companyController = TextEditingController();

  final priceController = TextEditingController();

  final saltController = TextEditingController();
  SellerService sellerService = SellerService();
  @override
  void initState() {
    super.initState();

    nameController.text = widget.name;
    stockController.text = widget.quantity;
    descriptionController.text = widget.description;
    companyController.text = widget.company;
    priceController.text = widget.price;
    saltController.text = widget.salt;
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
            const Spacer(),
            GestureDetector(
              onTap:(){
                sellerService.deleteMedicine(id: widget.id,context: context);
              },
              child: const Icon(
                Icons.delete_forever_sharp,
                color: color1,
                size: 30,
              ),
            )
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
              RoundedButton(
                size: size,
                title: 'UPDATE',
                onTap: () {
                  sellerService.updateMedicine(
                      id:widget.id,
                      medicineName: nameController.text,
                      context: context,
                      salt: saltController.text,
                      company: companyController.text,
                      price: priceController.text,
                      quantity: stockController.text,
                      description: descriptionController.text);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
