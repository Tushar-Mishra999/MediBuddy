import 'package:flutter/material.dart';

import '../../constants.dart';

class NearbyStore extends StatelessWidget {
  const NearbyStore({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width * 0.85,
      height: size.height * 0.17,
      decoration: BoxDecoration(
          border: Border.all(color: color1, width: 1),
          color: color2,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gupta Medicals',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 18,
                fontFamily: 'GilroyBold',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'A-9 1506 Jaypee Classic Sector 134, Noida Uttar Pradesh, India Earth, 201304',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_rounded,
                      color: color1,
                    ),
                    Text(
                      ' 9 am - 5 pm',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontFamily: 'GilroyLight',
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: color1,
                    ),
                    Text(
                      ' 9958904763',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
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
    );
  }
}
