import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceshop/data/datasource/remote/apiServices.dart';
import 'package:ecommerceshop/data/models/productsModel.dart';
import 'package:ecommerceshop/domain/homeScreenController.dart';
import 'package:ecommerceshop/presentation/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return SafeArea(
        child: ListView(
      children: [
        Container(
            width: double.infinity,
            height: 2300,
            child: FutureBuilder(
              future: ApiServices.api.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            "${products[itemIndex].image}",
                            height: 200,
                            width: 200,
                          ),
                        ),
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1500,
                        color: Colors.white,
                        child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.to(ProductDetails(
                                        productModel: products[index],
                                        index: index));
                                  },
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
                                                    "${products[index].image}"),
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
                                                        "${products[index].category}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "PermanentMarker-Regular"),
                                                      ),
                                                      Text(
                                                        "${products[index].description}",
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
                                                            "${products[index].price} .LE",
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
                                                              "${products[index].id}",
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
                                        width: 200,
                                        child: MaterialButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            controller.addToCart(
                                                products[index],
                                                products[index].price.toInt());
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Add To Cart",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "PermanentMarker-Regular",
                                                      fontSize: 20),
                                                ),
                                                SizedBox(width: 20),
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
                                ),
                            separatorBuilder: (context, index) =>
                                Container(height: 1, color: Colors.black),
                            itemCount: products.length),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "${snapshot.error.toString()}",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PermanentMarker-Regular"),
                  ));
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.orange,
                  ));
                }
              },
            ))
      ],
    ));
  }
}
