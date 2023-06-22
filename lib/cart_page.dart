import 'package:coffee/coffee_shop.dart';
import 'package:coffee/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removoItemFromCart(coffee);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<CoffeeShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(fontSize: 25),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                Coffee eachCoffee = value.userCart[index];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(eachCoffee.imagePath),
                                    fit: BoxFit.cover)),
                          ),
                          title: Text(eachCoffee.name),
                          subtitle: Text(eachCoffee.price ?? ''),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => removeFromCart(eachCoffee),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                    )
                  ],
                );
              },
            )),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.brown)),
                onPressed: payNow,
                icon: Icon(
                  Icons.payment,
                ),
                label: Text('  Pay Now    '))
          ],
        ),
      ),
    ));
  }
}
