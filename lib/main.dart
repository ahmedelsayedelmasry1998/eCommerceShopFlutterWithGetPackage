import 'package:ecommerceshop/domain/translation.dart';
import 'package:ecommerceshop/presentation/homeScreen.dart';
import 'package:ecommerceshop/presentation/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("en"),
      translations: Translate(),
      home: Start(),
    );
  }
}
