import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:medibuddy/models/seller.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/views/chat/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';

class StoreDetails extends StatefulWidget {
  static const routeName = '/store-details';
  StoreDetails({
    super.key,
    required this.searchQuery,
    required this.seller,
    required this.isCategory,
  });
  var searchQuery;
  bool isCategory;
  Seller seller;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  Future<void> openMaps() async {
    String locationString = widget.seller.coordinates;

    String latitudeString = locationString.split(',')[0].split(':')[1].trim();
    double latitude = double.parse(latitudeString);
    String longitudeString = locationString.split(',')[1].split(':')[1].trim();
    double longitude = double.parse(longitudeString);
    MapsLauncher.launchCoordinates(latitude, longitude);
    // final String googleMapsUrl =
    //     'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // //if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    //   await launchUrl(Uri.parse(googleMapsUrl));
    // } else {
    //   Fluttertoast.showToast(msg: "Please try again", backgroundColor: color1);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoreInfo(
          size: size,
          seller: widget.seller,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                '${widget.searchQuery['medicineName']}:${!widget.isCategory ? '(' : ''} ${!widget.isCategory ? widget.searchQuery['salt'] : ''} ${!widget.isCategory ? ')' : ''}',
                style: const TextStyle(
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
                widget.searchQuery['description'],
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChatScreen.routeName,
                      arguments: {
                        'seller': widget.seller,
                        'chatRoomId': "${user.email}${widget.seller.email}"
                      });
                },
                child: Container(
                  height: size.width * 0.15,
                  width: size.width * 0.15,
                  decoration: BoxDecoration(
                      color: color1, borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.message_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  openMaps();
                },
                child: Container(
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
    required this.seller,
  }) : super(key: key);

  final Size size;
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    // print(
    //   seller.category
    //       .toString()
    //       .substring(1, seller.category.toString().length - 1),
    // );
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
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/doc4.png"),
            radius: 100,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            seller.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'GilroyBold',
              fontWeight: FontWeight.w100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                seller.reviews['ratings'].length > 0
                    ? " ${seller.reviews['sum']} | ${seller.reviews['ratings'].length} Reviews"
                    : 'No Reviews',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            seller.category
                .toString()
                .substring(1, seller.category.toString().length - 1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'GilroyLight',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            seller.address,
            style: const TextStyle(
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
            children: [
              // const Icon(
              //   Icons.star,
              //   color: Colors.yellow,
              // ),
              // Text(
              //   seller.reviews['ratings'].length > 0
              //       ? " ${seller.reviews['sum']} | ${seller.reviews['ratings'].length} Reviews"
              //       : 'No Reviews',
              //   style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 15,
              //       fontFamily: 'GilroyLight',
              //       fontWeight: FontWeight.w800),
              // ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    seller.shopTimings,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  Text(
                    seller.phoneNumber,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'GilroyLight',
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
