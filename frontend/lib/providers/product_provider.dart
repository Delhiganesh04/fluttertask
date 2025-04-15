import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final baseUrl = 'http://192.168.29.151:3000/products';

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final res = await http.get(Uri.parse(baseUrl));
    final data = json.decode(res.body) as List;
    _products = data.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );
    final newProduct = Product.fromJson(json.decode(res.body));
    _products.add(newProduct);
    notifyListeners();
  }

  // Product getById(String id) => _products.firstWhere((p) => p.id == id);
  Product? getById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> updateProduct(Product product) async {
    await http.put(
      Uri.parse('$baseUrl/${product.id}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );
    await fetchProducts();
  }

  Future<void> deleteProduct(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
