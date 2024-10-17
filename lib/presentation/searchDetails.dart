import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceshop/data/models/productsModel.dart';
import 'package:flutter/material.dart';

class SearchDetails extends StatelessWidget {
  List<ProductModel> productModel;
  int index;
  SearchDetails({super.key, required this.productModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Product Details",
            style: TextStyle(
                fontFamily: "PermanentMarker-Regular", color: Colors.white),
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                    imageUrl: "${productModel[index].image}",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${productModel[index].title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "PermanentMarker-Regular",
                      color: Colors.green),
                ),
                Container(
                  color: Colors.black12,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${productModel[index].description}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: "Time New Roman"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        minWidth: 150,
                        color: Colors.black26,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                        child: Row(children: [
                          Text("Add To Cart"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shopping_cart)
                        ]),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        minWidth: 150,
                        color: Colors.black26,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                        child: Row(children: [
                          Text("Buy Now"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.price_change)
                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: MaterialButton(
                      padding: EdgeInsets.all(10),
                      minWidth: 150,
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      child: Text("Go To Home Page")),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
