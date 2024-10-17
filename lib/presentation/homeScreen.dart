import 'package:ecommerceshop/domain/homeScreenController.dart';
import 'package:ecommerceshop/presentation/productSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenController controller =
        Get.put(HomeScreenController()); //Depandency Injection
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                controller.titles[controller.currentInex].tr,
                style: TextStyle(
                    fontFamily: "PermanentMarker-Regular", color: Colors.white),
              ),
              backgroundColor: Colors.green,
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: ProductSearch());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    )),
                Container(
                  width: 70,
                  child: Stack(children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      width: 30,
                      right: 10,
                      top: -20,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.red,
                        child: Text(
                          "${controller.cartCount}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.black87,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.white,
                currentIndex: controller.currentInex,
                onTap: (value) {
                  controller.currentInex = value;
                  controller.update();
                },
                items: [
                  BottomNavigationBarItem(
                      label: "a".tr, icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "b".tr, icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "c".tr, icon: Icon(Icons.shopping_cart)),
                ]),
            body: controller.screens[controller.currentInex]);
      },
    );
  }
}
