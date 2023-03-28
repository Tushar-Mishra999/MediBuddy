import 'package:flutter/material.dart';
import 'package:medibuddy/views/home/medicinetype.dart';
import 'package:medibuddy/views/home/nearbystore.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/result/searchresult.dart';
import '../../constants.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoreInfo(size: size),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              const Text(
                'Cetirizine ( Antihistamine )',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'If you are taking the over-the-counter product to self-treat, read all directions on the product package before taking this medication. If you have any questions, consult your pharmacist. If your doctor has prescribed this medication, take it as directed, usually once daily.',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ]),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: size.width * 0.15,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                height: size.width * 0.15,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.message_sharp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                height: size.width * 0.15,
                width: size.width * 0.55,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Navigate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class StoreInfo extends StatelessWidget {
  const StoreInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.6,
      width: size.width * 1,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(40),
      ),
      child: SafeArea(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/doc4.png"),
            radius: 100,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'Gupta Medicals',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'GilroyBold',
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'Allopathy | Homeopathy | Ayurvedic',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'GilroyLight',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const Text(
            'A-9, 1506, Jaypee Classic Sector 134, Noida',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'GilroyLight',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                ' 4.5 | 2k Reviews',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
              Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
              ),
              Text(
                '9 am - 5 pm',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              Text(
                '9958904763',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
