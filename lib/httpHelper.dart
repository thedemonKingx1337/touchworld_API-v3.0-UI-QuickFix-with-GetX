import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class HttpHelper {
  static Future<List<ProductModel>> fetchDetails() async {
    var response = await http.get(Uri.parse(
        "http://testapp.touchworldtechnology.com:3009/v1/product/getAllProduct"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> productListData = data["data"] as List<dynamic>;

      List<ProductModel> productList =
          productListData.map((item) => ProductModel.fromJson(item)).toList();

      return productList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
