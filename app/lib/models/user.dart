class User {
  final String name;
  final String email;
  final String type;

  User({required this.name, required this.email, required this.type});

  static User fromJson(Map<String, dynamic> data) {
    return User(name: data['name'], email: data['email'], type: data['type']);
  }
}
