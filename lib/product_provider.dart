import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List _products = [];

  List get products => _products;

  void setProducts(List products) {
    _products = products;
    notifyListeners();
  }
}