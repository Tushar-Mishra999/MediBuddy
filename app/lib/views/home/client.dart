import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medibuddy/views/home/medicinetype.dart';
import 'package:medibuddy/views/home/nearbystore.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import '../../constants.dart';

class ClientHomeScreen extends StatelessWidget {
  static const String routeName = '/client-home';
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Center(
        child: Column(children: [
          Container(
            height: size.height * 0.18,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tip of the Day!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'An apple a day keeps',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 17,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'keeps the doctor away',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 17,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoundedSearchBar(
              hintText: 'Search for your company',
              onSubmitted: (value) {},
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          MedicineType(size: size),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Text(
                  'Nearby Stores',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          NearbyStore(size: size),
          NearbyStore(size: size)
        ]),
      ),
    );
  }
}
