import 'package:flutter/material.dart';
import 'package:medibuddy/models/medicine.dart';

import '../../constants.dart';
import '../../models/seller.dart';
import '../details/store_details.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(
      {Key? key,
      required this.size,
      required this.seller,
      required this.searchQuery,
      required this.isCategory})
      : super(key: key);

  final Size size;
  final Seller seller;
  final String searchQuery;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isCategory) {
          var stock = seller.stock;
          var searchedMedicine;
          for (var medicine in stock) {
            if (medicine['medicineName'].toLowerCase() ==
                searchQuery.toLowerCase()) {
              searchedMedicine = medicine;
            }
          }
          Navigator.pushNamed(context, StoreDetails.routeName, arguments: {
            'seller': seller,
            'searchQuery': searchedMedicine,
            'isCategory': false
          });
        } else {
          var category = {
            'medicineName': searchQuery,
            'description': description[searchQuery],
          };
          Navigator.pushNamed(context, StoreDetails.routeName, arguments: {
            'seller': seller,
            'searchQuery': category,
            'isCategory': true
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(2),
        width: size.width * 0.85,
        height: size.height * 0.18,
        decoration: BoxDecoration(
            border: Border.all(color: color1, width: 1),
            color: color3,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    seller.name,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                  const Spacer(),
                  Switch.adaptive(
                      activeColor: color1,
                      inactiveThumbColor: color2,
                      value: seller.status,
                      onChanged: (val) {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: color1,
                      ),
                      Text(
                        ' 4.5 | 2k Reviews',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            fontFamily: 'GilroyLight',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: color1, width: 1)),
                    child: Center(
                      child: Row(
                        children: const [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_on,
                              color: color1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Reach',
                              style: TextStyle(
                                  color: color1,
                                  fontSize: 15,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Row(
                        children: const [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Contact',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
