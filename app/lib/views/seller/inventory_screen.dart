import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/seller/medicine.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: color1,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const Text(
                "Inventory  ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'GilroyBold',
                  fontWeight: FontWeight.w100,
                ),
              ),
              const Spacer(),
              Switch.adaptive(
                  activeColor: color1,
                  inactiveThumbColor: color2,
                  value: true,
                  onChanged: (val) {}),
              const Icon(
                Icons.message_outlined,
                color: color1,
                size: 30,
              ),
            ]),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          RoundedSearchBar(
              hintText: 'Search Medicine', onSubmitted: (value) {}),
          SizedBox(
            height: size.height * 0.05,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: <Widget>[Medicine(size: size), Medicine(size: size)],
          ),
        ])));
  }
}
