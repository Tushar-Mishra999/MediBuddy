class Seller {
  final String id;
  final String name;
  final String email;
  final String city;
  final String address;
  final String phoneNumber;
  final bool status;

  Seller(
      {required this.id,
      required this.name,
      required this.email,
      required this.city,
      required this.address,
      required this.phoneNumber,
      required this.status});

  static Seller fromMap(Map<String, dynamic> data) {
    return Seller(
        name: data['name'],
        id: data['_id'],
        email:data['email'],
        city:data['city'],
        address: data['address'],
        phoneNumber: data['phoneNumber'].toString(),
        status: data['status']);
  }
}
