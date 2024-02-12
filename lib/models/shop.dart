import 'package:flutter/material.dart';
import 'package:sushi_app/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Philadelphia Roll",
      price: "23.00",
      imagePath:
          "assets/images/sushi-japanese-cuisine-asian-cuisine-chinese-cuisine-seafood-sushi-png-image-e760707704995b8f67679a3518adb232.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna Nigiri",
      price: "26.00",
      imagePath:
          "assets/images/sushi-unagi-sashimi-onigiri-japanese-cuisine-sushi-eedc27c34a10d7088199bd53e4ef884d.png",
      rating: "4.2",
    ),
    Food(
      name: "Makizushi rolls",
      price: "23.00",
      imagePath:
          "assets/images/sushi-california-roll-makizushi-japanese-cuisine-pizza-sushi-2827b2d02e1862871c75b243930a27dd.png",
      rating: "4.2",
    ),
    Food(
      name: "Nigirizushi",
      price: "26.00",
      imagePath:
          "assets/images/sushi-pizza-makizushi-japanese-cuisine-sashimi-825a258897e4e60ebe87680eddfbbe9e.png",
      rating: "4.9",
    ),
  ];

  // Customer cart
  final List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  List<Food> favorites = [];

  void addToFavorite(Food foodItem) {
    favorites.add(foodItem);
    notifyListeners();
  }

  void removeFromFav(Food food) {
    favorites.remove(food);
    notifyListeners();
  }
}
