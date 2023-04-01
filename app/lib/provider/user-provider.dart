import 'package:flutter/material.dart';
import 'package:medibuddy/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(email: '', city: '', name: '', type: '',status: true);

  User get user => _user;
  void setUser(Map<String, dynamic> user) {
    _user = User.fromMap(user);
    notifyListeners();
  }

 
  // void setisSignedUp(bool isSignedUp) {
  //   _user.isSignedUp = isSignedUp;
  //   notifyListeners();
  // }

  // void setisLoggedIn(bool isLoggedIn){
  //    _user.isLoggedIn = isLoggedIn;
  //   notifyListeners();
  // }
}
