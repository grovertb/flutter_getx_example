import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_example/models/product.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];

  List<Product> get products => _products;

  @override
  void onInit() {
    super.onInit();
    print("onInit GlobalController");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString = await rootBundle.loadString('products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJSON(e))
        .toList();

    print("Products LOADED");
    update(["products"]);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = this._products[index];

    product.isFavorite = isFavorite;
    update(["products"]);
  }
}
