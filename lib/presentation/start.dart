import 'package:ecommerceshop/presentation/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7CCCC),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            onPressed: () {
              Get.updateLocale(Locale('ar'));
              Get.to(LoginScreen());
            },
            child: Text("d".tr),
            color: Colors.deepOrange,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              Get.updateLocale(Locale('en'));
              Get.to(LoginScreen());
            },
            child: Text("e".tr),
            color: Colors.deepOrange,
            textColor: Colors.white,
          ),
        ],
      )),
    );
  }
}
