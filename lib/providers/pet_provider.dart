import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final List<String> favoritePets = [];

  void addFavorite(String pet) {
    favoritePets.add(pet);
    notifyListeners();
  }

  void removeFavorite(String pet) {
    favoritePets.remove(pet);
    notifyListeners();
  }
}