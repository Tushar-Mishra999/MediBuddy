import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello, ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'GilroyBold',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: "William Jack",
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
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Today, ${DateTime.now().day} ${DateFormat.MMMM().format(DateTime.now()).substring(0, 3)} ${DateTime.now().year}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color1, width: 1)),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
