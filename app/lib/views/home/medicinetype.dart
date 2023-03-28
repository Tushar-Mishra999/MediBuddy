import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';

class MedicineType extends StatelessWidget {
  const MedicineType({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: color2, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ayurvedic',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: color2, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Homeopathic',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: color2, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Allopathic',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
