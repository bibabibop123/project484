import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final int quantity;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
