import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7CCCC),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "f".tr,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "PermanentMarker-Regular",
                  fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: "Email ...",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: "Password ...",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(MyHomeScreen());
                    },
                    color: Colors.deepOrange,
                    child: Text(
                      "f".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "PermanentMarker-Regular"),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
