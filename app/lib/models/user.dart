class User {
  final String name;
  final String email;
  final String city;
  final String type;
  User({required this.name, required this.email, required this.city,required this.type});

  static User fromMap(Map<String, dynamic> data) {
    return User(name: data['name'], email: data['email'], city: data['city'],type: data['type']);
  }

  User copyWith(
      {required String name, required String username, required String email}) {
    return User(name: name, email: email, city: city,type: type);
  }
}
