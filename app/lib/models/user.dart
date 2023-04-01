class User {
  final String name;
  final String email;
  final String city;
  final String type;
  bool status;
  User(
      {required this.name,
      required this.email,
      required this.city,
      required this.type,
      required this.status});

  static User fromMap(Map<String, dynamic> data) {
    return User(
        name: data['name'],
        email: data['email'],
        city: data['city'],
        type: data['type'],
        status: data['status']??true);
  }

  User copyWith(
      {required String name, required String username, required String email}) {
    return User(name: name, email: email, city: city, type: type,status: status);
  }
}
