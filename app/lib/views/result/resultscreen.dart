import 'package:flutter/material.dart';
import 'package:medibuddy/controller/client-service.dart';
import 'package:medibuddy/models/medicine.dart';
import 'package:medibuddy/models/seller.dart';
import 'package:medibuddy/views/home/medicinetype.dart';
import 'package:medibuddy/views/home/nearbystore.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/result/resultcard.dart';
import '../../constants.dart';

class ResultsScreen extends StatefulWidget {
  static const routeName = '/results-screen';
  const ResultsScreen({super.key, required this.medicine});
  final String medicine;
  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  ClientService clientService = ClientService();
  List<Seller> sellerList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    searchResult(medicine: widget.medicine);
  }

  void searchResult({required String medicine}) async {
    sellerList =
        await clientService.searchResult(context: context, medicine: medicine);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Search",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'GilroyBold',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                TextSpan(
                  text: " Results",
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
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int index = 0; index < sellerList.length; index++)
                SearchResult(
                  size: size,
                  seller: sellerList[index],
                  medicine: widget.medicine,
                )
            ],
          ),
        ),
      ),
    );
  }
}
