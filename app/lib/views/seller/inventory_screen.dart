import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/seller/add_medicine.dart';
import 'package:medibuddy/views/seller/medicine.dart';
import 'package:provider/provider.dart';

import '../../controller/seller_service.dart';
import '../../models/medicine.dart';
import '../../provider/user-provider.dart';

class InventoryScreen extends StatefulWidget {
  static const String routeName = '/inventory-screen';
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Medicine> medicine = [];
  SellerService sellerService = SellerService();
  @override
  void initState() {
    super.initState();
    getMedicine();
  }

  void getMedicine() async {
    medicine = await sellerService.getMedicine(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: color1,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AddMedicine.routeName);
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                  value: user.status,
                  onChanged: (val) async{
                    user.status=await sellerService.changeStatus(context, val);
                    setState(() {
                    });
                  }),
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
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: medicine.length, // number of items
            itemBuilder: (BuildContext context, int index) {
              return medicine.isEmpty
                  ? const Center(child: Text("No medicine"))
                  : MedicineDetail(
                      size: size,
                      description: medicine[index].description,
                      name: medicine[index].name,
                      company: medicine[index].company,
                      price: medicine[index].price,
                      quantity: medicine[index].quantity,
                      salt: medicine[index].salt,
                    );
            },
          ),
        ])));
  }
}
