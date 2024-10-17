import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceshop/domain/homeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(body: GetBuilder<HomeScreenController>(
      builder: (controller) {
        if (controller.cartProducts.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        } else {
          return Center(
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Expanded(
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Is ${controller.total} .LE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PermanentMarker-Regular"),
                              ),
                              MaterialButton(
                                color: Colors.deepOrange,
                                textColor: Colors.white,
                                onPressed: () {},
                                child: Text(
                                  "Go To Pay",
                                  style: TextStyle(
                                      fontFamily: "PermanentMarker-Regular"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 1500,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                      child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: CachedNetworkImage(
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(
                                                      color: Colors.deepOrange,
                                                    ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.fill,
                                                imageUrl:
                                                    "${controller.cartProducts[index].image}"),
                                          ),
                                          Expanded(
                                              child: Container(
                                                  padding: EdgeInsets.all(15),
                                                  margin: EdgeInsets.all(10),
                                                  height: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${controller.cartProducts[index].category}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "PermanentMarker-Regular"),
                                                      ),
                                                      Text(
                                                        "${controller.cartProducts[index].description}",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontFamily: "Arial",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${controller.cartProducts[index].price} .LE",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    "PermanentMarker-Regular",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                              "${controller.cartProducts[index].id}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontFamily:
                                                                      "PermanentMarker-Regular",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      )
                                                    ],
                                                  )))
                                        ],
                                      ),
                                      Container(
                                        width: 260,
                                        child: MaterialButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            controller.removeFromCart(
                                                controller.cartProducts[index],
                                                controller
                                                    .cartProducts[index].price
                                                    .toInt());
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Remove From Cart",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "PermanentMarker-Regular",
                                                      fontSize: 20),
                                                ),
                                                SizedBox(width: 10),
                                                Icon(
                                                    Icons.shopping_cart_rounded)
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Container(height: 2, color: Colors.black),
                              itemCount: controller.cartProducts.length),
                        )
                      ],
                    ),
                  ],
                ),
              )),
            ),
          );
        }
      },
    ));
  }
}
