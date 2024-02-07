import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/_products.dart';
import 'package:http/http.dart' as http;

class NetworkRequest{
  static const String url = 'https://dummyjson.com/products';

  static List<Products> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody);
    if (parsed['products'] != null) {
      return List<Products>.from(parsed['products'].map((model) => Products.fromJson(model)));
    } else {
      throw FormatException("Invalid data format");
    }
  }


  static Future<List<Products>> fetchProducts() async{
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return compute (parseProducts, response.body);
    }
    else{
      throw Exception("Can't get products");
    }
  }
}
