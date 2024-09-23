import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List shopItems = [
    ["Avocado", "400.30", "assets/avocado.png", Colors.green],
    ["Banana", "200.00", "assets/banana.png", Colors.yellow],
    ["Chicken", "650.25", "assets/chicken.png", Colors.brown],
    ["Water", "100.50", "assets/water.png", Colors.lightBlue],
  ];

  List cartItmes = [];

  get sitems => shopItems;
  get citems => cartItmes;

  void addItemtoCart(int index){
    cartItmes.add(shopItems[index]);
    notifyListeners();
  }

  void removeItemsfromCart(int index){
    cartItmes.removeAt(index);
    notifyListeners();
  }

  String CalculateTotal(){
    double totalPrice = 0;
    for(int i = 0; i < cartItmes.length; i++){
      totalPrice += double.parse(cartItmes[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}