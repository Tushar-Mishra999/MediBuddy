import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/contact/contact.dart';
import 'package:medibuddy/views/home/searchbar.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/seller/add_medicine.dart';
import 'package:medibuddy/views/seller/medicine.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Medicine> filteredmedicine = [];
  SellerService sellerService = SellerService();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getMedicine();
  }

  Future<void> getMedicine() async {
    isLoading = true;
    setState(() {});
    medicine = await sellerService.getMedicine(context: context);
    filteredmedicine = medicine;
    setState(() {});
    isLoading = false;
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
            Navigator.pushNamed(context, AddMedicine.routeName).then(
              (value) async {
                await getMedicine();
              },
            );
            ;
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
                  onChanged: (val) async {
                    user.status =
                        await sellerService.changeStatus(context, val);
                    setState(() {});
                  }),
              SizedBox(
                width: size.width * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ContactScreen.routeName);
                },
                child: const Icon(
                  Icons.message_outlined,
                  color: color1,
                  size: 30,
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isLoggedIn', false);
                  prefs.setString('name', '');
                  prefs.setString('email', '');
                  prefs.setString('city', '');
                  Navigator.popAndPushNamed(
                      context, OnboardingScreen.routeName);
                },
                child: const Icon(
                  Icons.logout_outlined,
                  color: color1,
                  size: 30,
                ),
              ),
            ]),
          ),
        ),
        body: SafeArea(
            child: RefreshIndicator(
          displacement: 100,
          color: color1,
          onRefresh: getMedicine,
          child: Column(children: [
            RoundedSearchBar(
              hintText: 'Search Medicine',
              onSubmitted: (value) {},
              onChanged: ((value) {
                setState(() {
                  filteredmedicine = medicine
                      .where((item) =>
                          item.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.orange.shade800,
                  ))
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: filteredmedicine.length, // number of items
                    itemBuilder: (BuildContext context, int index) {
                      return medicine.isEmpty
                          ? const Center(child: Text("No medicine"))
                          : MedicineDetail(
                              func: getMedicine,
                              size: size,
                              id: filteredmedicine[index].id,
                              description: filteredmedicine[index].description,
                              name: filteredmedicine[index].name,
                              company: filteredmedicine[index].company,
                              price: filteredmedicine[index].price,
                              quantity: filteredmedicine[index].quantity,
                              salt: filteredmedicine[index].salt,
                            );
                    },
                  ),
          ]),
        )));
  }
}
