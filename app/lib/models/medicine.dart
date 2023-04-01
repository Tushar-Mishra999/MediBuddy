class Medicine {
  final String name;
  final String quantity;
  final String price;
  final String salt;
  final String company;
  final String description;
  final String id;

  Medicine(
      {required this.name,
      required this.quantity,
      required this.id,
      required this.price,
      required this.salt,
      required this.company,
      required this.description});

  static Medicine fromMap(Map<String, dynamic> data) {
    return Medicine(
        name: data['medicineName'],
        id:data['_id'],
        quantity: data['quantity'].toString(),
        salt: data['salt'],
        company: data['company'],
        description: data['description'],
        price: data['price'].toString());
  }
}
