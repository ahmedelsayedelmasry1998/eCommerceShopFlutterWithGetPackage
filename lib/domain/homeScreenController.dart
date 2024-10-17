import 'package:ecommerceshop/data/datasource/remote/apiServices.dart';
import 'package:ecommerceshop/data/models/productsModel.dart';
import 'package:ecommerceshop/presentation/bodyHomeScreen.dart';
import 'package:ecommerceshop/presentation/profileScreen.dart';
import 'package:ecommerceshop/presentation/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<Widget> screens = [
    BodyHomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
  int currentInex = 0;
  List<String> titles = ["a", "b", "c"];

  List<ProductModel> cartProducts = [];
  int cartCount = 0;
  int total = 0;
  addToCart(ProductModel product, int price) {
    cartProducts.add(product);
    cartCount++;
    total += price;
    update();
  }

  removeFromCart(ProductModel product, int price) {
    cartProducts.remove(product);
    cartCount--;
    total -= price;
    update();
  }
}
