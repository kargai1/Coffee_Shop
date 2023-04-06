import 'package:coffee/models.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Espresso',
        imagePath: 'assets/images/espresso.webp',
        smallPrice: '4.00',
        mediumPrice: '4.50',
        largePrice: '5.00'),
    Coffee(
        name: 'Latte',
        imagePath: 'assets/images/latte.jpeg',
        smallPrice: '4.50',
        mediumPrice: '5.00',
        largePrice: '5.50'),
    Coffee(
        name: 'Mocha',
        imagePath: 'assets/images/mocha.jpeg',
        smallPrice: '4.50',
        mediumPrice: '5.00',
        largePrice: '5.50'),
    Coffee(
        name: 'Americano',
        imagePath: 'assets/images/americano.jpeg',
        smallPrice: '4.00',
        mediumPrice: '4.50',
        largePrice: '5.00'),
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removoItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
