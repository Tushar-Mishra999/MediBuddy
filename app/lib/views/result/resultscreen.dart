import 'package:flutter/material.dart';
import 'package:medibuddy/controller/client-service.dart';
import 'package:medibuddy/models/seller.dart';
import 'package:medibuddy/views/result/resultcard.dart';
import '../../constants.dart';

class ResultsScreen extends StatefulWidget {
  static const routeName = '/results-screen';
  const ResultsScreen(
      {super.key, required this.searchQuery, required this.isCategory});
  final String searchQuery;
  final bool isCategory;
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
    searchResult(searchQuery: widget.searchQuery);
  }

  void searchResult({required String searchQuery}) async {
    if (widget.isCategory) {
      sellerList = await clientService.categoryResult(
          context: context, category: searchQuery);
    } else {
      sellerList = await clientService.searchResult(
          context: context, medicine: searchQuery);
    }

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
      body: isLoading? Center(
                child: CircularProgressIndicator(
                color: Colors.orange.shade800,
              )):SingleChildScrollView(
        child: sellerList.isEmpty
                ? SizedBox(
                    height: size.height * 0.7,
                    child: const Center(
                      child: Text(
                        "No seller found",
                        style: TextStyle(
                          color: color1,
                          fontSize: 25,
                          fontFamily: 'GilroyBold',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int index = 0; index < sellerList.length; index++)
                          SearchResult(
                            size: size,
                            seller: sellerList[index],
                            searchQuery: widget.searchQuery,
                            isCategory: widget.isCategory,
                          )
                      ],
                    ),
                  ),
      ),
    );
  }
}
