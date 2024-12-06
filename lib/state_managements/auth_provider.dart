import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? email;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    loadAuth();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status, {String? email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (status) {
      this.email = email;
    } else {
      this.email = null;
    }
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }

  // void logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = false;
  //   await prefs.setBool("isLoggedIn", false);
  //   notifyListeners();
  // }
}
