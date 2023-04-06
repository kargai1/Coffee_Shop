import 'package:coffee/coffee_shop.dart';
import 'package:coffee/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coffee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  var _price;

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Text(
                'Coffee From Heaven!',
                style: TextStyle(fontSize: 30),
              )),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: value.coffeeShop.length,
              itemBuilder: (context, index) {
                Coffee eachCoffee = value.coffeeShop[index];
                Coffee eachCoffee1 = Coffee(
                    name: eachCoffee.name,
                    imagePath: eachCoffee.imagePath,
                    smallPrice: '',
                    mediumPrice: '',
                    largePrice: '',
                    price: eachCoffee.price);
                return CoffeeTile(
                  coffee: eachCoffee,
                  onPressedsmall: () {
                    eachCoffee1.price = eachCoffee.smallPrice;
                    addToCart(eachCoffee1);
                  },
                  onPressedmedium: () {
                    eachCoffee1.price = eachCoffee.mediumPrice;

                    addToCart(eachCoffee1);
                  },
                  onPressedlarge: () {
                    eachCoffee1.price = eachCoffee.largePrice;
                    addToCart(eachCoffee1);
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
