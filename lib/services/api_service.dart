import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_project/app/models/product_model.dart';

class ApiService {
  Future<List<Product>> getProducts() async {
    const productsUrl = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(productsUrl));
    final Iterable items = jsonDecode(response.body);
    return items.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getSignleProduct(int id) async {
    var productsUrl = "https://fakestoreapi.com/products/${id.toString()}";
    final response = await http.get(Uri.parse(productsUrl));
    final item = jsonDecode(response.body);
    return Product.fromJson(item);
  }
}
