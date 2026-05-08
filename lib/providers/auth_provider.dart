import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? userName;
  String? email;
  String? photoUrl;
  String? role;

  void loginUser({
    required String name,
    required String userEmail,
    required String userPhoto,
  }) {
    userName = name;
    email = userEmail;
    photoUrl = userPhoto;
    role = "user";
    notifyListeners();
  }

  void loginAdmin() {
    role = "admin";
    notifyListeners();
  }

  void logout() {
    userName = null;
    email = null;
    photoUrl = null;
    role = null;
    notifyListeners();
  }
}