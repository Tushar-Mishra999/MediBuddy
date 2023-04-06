class Seller {
  final String id;
  final String name;
  final String email;
  final String city;
  final String address;
  final String phoneNumber;
  final bool status;
  final String shopTimings;
  final List<dynamic> category;
  final String coordinates;
  final List<dynamic> stock;
  final Map<String, dynamic> reviews;

  Seller(
      {required this.coordinates,
      required this.reviews,
      required this.id,
      required this.name,
      required this.email,
      required this.city,
      required this.address,
      required this.phoneNumber,
      required this.shopTimings,
      required this.stock,
      required this.category,
      required this.status});

  static Seller fromMap(Map<String, dynamic> data) {
    return Seller(
        name: data['name'],
        id: data['_id'],
        email: data['email'],
        city: data['city'],
        address: data['address'],
        shopTimings: data['shopTimings'],
        category: data['category'],
        coordinates: data['coordinates'],
        reviews: data['reviews'],
        stock:data['stock'],
        phoneNumber: data['phoneNumber'].toString(),
        status: data['status']);
  }
}
