import 'package:flutter/material.dart';
import 'package:medibuddy/views/seller/update_medicine.dart';

import '../../constants.dart';

class Medicine extends StatelessWidget {
  const Medicine({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateMedicine.routeName);
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
                'Crocin',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontFamily: 'GilroyBold',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Dr. Reddy',
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
                'Antihistamine',
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
                      Icon(
                        Icons.currency_rupee,
                        color: color1,
                      ),
                      Text(
                        ' 300',
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
                      Icon(
                        Icons.production_quantity_limits,
                        color: color1,
                      ),
                      Text(
                        ' 30',
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
