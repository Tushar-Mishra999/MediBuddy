import 'package:flutter/material.dart';
import 'package:medibuddy/views/home/medicinetype.dart';
import 'package:medibuddy/views/home/nearbystore.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/result/searchresult.dart';
import '../../constants.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
      body: Center(
        child: Column(
          children: [
            SearchResult(size: size),
            SearchResult(size: size),
            SearchResult(size: size),
          ],
        ),
      ),
    );
  }
}
