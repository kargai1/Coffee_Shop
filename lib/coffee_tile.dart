import 'package:coffee/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  final void Function()? onPressedsmall;
  final void Function()? onPressedmedium;
  final void Function()? onPressedlarge;

  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressedsmall,
      required this.onPressedlarge,
      required this.onPressedmedium});

  @override
  State<CoffeeTile> createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  var _coffee;
  var _onPressedsmall;
  var _onPressedmedium;
  var _onPressedlarge;

  var _Size;
  @override
  void initState() {
    _onPressedlarge = widget.onPressedlarge;
    _onPressedmedium = widget.onPressedmedium;
    _onPressedsmall = widget.onPressedsmall;
    _coffee = widget.coffee;
    // TODO: implement initState
    super.initState();
  }

  @override
  List bigOrSmall = ['small', 'medium', 'large'];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.grey,
        title: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(_coffee.imagePath),
                        fit: BoxFit.cover)),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _coffee.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[400])),
                  onPressed: _onPressedsmall,
                  child: Text(
                    'Small \n ${_coffee.smallPrice}',
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[400])),
                  onPressed: _onPressedmedium,
                  child: Text(
                    'Medium \n ${_coffee.mediumPrice}',
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[400])),
                  onPressed: _onPressedlarge,
                  child: Text(
                    'Large \n ${_coffee.largePrice}',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
