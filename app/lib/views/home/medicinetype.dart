import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/result/resultscreen.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ResultsScreen.routeName,
                arguments: {'searchQuery': 'Ayurvedic', 'isCategory': true});
          },
          child: Container(
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
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ResultsScreen.routeName,
                arguments: {'searchQuery': 'Homeopathic', 'isCategory': true});
          },
          child: Container(
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
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ResultsScreen.routeName,
                arguments: {'searchQuery': 'Allopathic', 'isCategory': true});
          },
          child: Container(
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
          ),
        )
      ],
    );
  }
}
