import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String photo = '';

  void setUser({
    required String newName,
    required String newEmail,
    required String newPhoto,
  }) {
    name = newName;
    email = newEmail;
    photo = newPhoto;

    notifyListeners();
  }

  void clearUser() {
    name = '';
    email = '';
    photo = '';

    notifyListeners();
  }
}