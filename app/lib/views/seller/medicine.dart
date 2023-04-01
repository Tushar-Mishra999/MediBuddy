import 'package:flutter/material.dart';
import 'package:medibuddy/views/seller/update_medicine.dart';

import '../../constants.dart';

class MedicineDetail extends StatelessWidget {
  final String company;
  final Size size;
  final String name;
  final String quantity;
  final String price;
  final String salt;
  final String description;
  final String id;
  const MedicineDetail(
      {Key? key,
      required this.size,
      required this.name,
      required this.company,
      required this.quantity,
      required this.price,
      required this.description,
      required this.id,
      required this.salt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateMedicine.routeName, arguments: {
          'name': name,
          'quantity': quantity,
          'description': description,
          'company': company,
          'price': price,
          'salt': salt,
          'id': id,
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: size.width * 0.7,
        height: size.height * 0.12,
        decoration: BoxDecoration(
            border: Border.all(color: color1, width: 1),
            color: color2,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontFamily: 'GilroyBold',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                company,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                salt,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: color1,
                      ),
                      Text(
                        ' $price',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                            fontFamily: 'GilroyLight',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.production_quantity_limits,
                        color: color1,
                      ),
                      Text(
                        ' $quantity',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                            fontFamily: 'GilroyLight',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
