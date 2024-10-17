import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceshop/data/datasource/remote/apiServices.dart';
import 'package:ecommerceshop/data/models/productsModel.dart';
import 'package:ecommerceshop/presentation/searchDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("data"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: ApiServices.api.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          List<ProductModel> filter = products.where((element) {
            return element.description.contains(query);
          }).toList();
          return Container(
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        query == ""
                            ? Get.to(SearchDetails(
                                productModel: products,
                                index: index,
                              ))
                            : Get.to(SearchDetails(
                                productModel: filter,
                                index: index,
                              ));
                      },
                      child: Container(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                          color: Colors.deepOrange,
                                        ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                    imageUrl: query == ""
                                        ? "${products[index].image}"
                                        : "${filter[index].image}"),
                              ),
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      margin: EdgeInsets.all(10),
                                      height: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            query == ""
                                                ? products[index]
                                                    .category
                                                    .toString()
                                                : filter[index]
                                                    .category
                                                    .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily:
                                                    "PermanentMarker-Regular"),
                                          ),
                                          Text(
                                            query == ""
                                                ? products[index]
                                                    .description
                                                    .toString()
                                                : filter[index]
                                                    .description
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.bold),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                query == ""
                                                    ? products[index]
                                                        .price
                                                        .toString()
                                                    : filter[index]
                                                        .price
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontFamily:
                                                        "PermanentMarker-Regular",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Text(
                                                  query == ""
                                                      ? products[index]
                                                          .id
                                                          .toString()
                                                      : filter[index]
                                                          .id
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily:
                                                          "PermanentMarker-Regular",
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )),
                    ),
                separatorBuilder: (context, index) =>
                    Container(height: 1, color: Colors.black),
                itemCount: query == "" ? products.length : filter.length),
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
    );
  }
}
