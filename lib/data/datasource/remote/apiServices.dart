import 'package:ecommerceshop/data/models/productsModel.dart';

import '../../../utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static final ApiServices api = ApiServices(); //Singleton design pattern
  Future<List<ProductModel>> getAllProducts() async {
    String url = "/products";
    http.Response response = await http.get(Uri.parse("$baseUrl$url"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Unable To Fetch ...");
    }
  }
}
