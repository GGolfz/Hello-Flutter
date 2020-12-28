import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';
import '../dummy_products.dart';
import '../models/http_exception.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;
  final _url =
      'https://flutterlearn-c0a20-default-rtdb.firebaseio.com/products.json';
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(this._url);
      Map<String, dynamic> data = await json.decode(response.body);
      List<Product> products = [];
      data.forEach((key, value) async {
        // var val = await json.decode(value);
        Product p = Product(
            title: value['title'],
            description: value['description'],
            price: value['price'],
            imageUrl: value['imageUrl'],
            isFavorite: value['isFavorite'],
            id: key);
        products.add(p);
      });
      this._items = products;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(this._url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite
          }));
      final newProduct = Product(
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          id: json.decode(response.body)['name']);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final url = '${this._url.split('.json')[0]}/$id.json';
      try {
        await http.patch(url,
            body: json.encode({
              'title': newProduct.title,
              'description': newProduct.description,
              'imageUrl': newProduct.imageUrl,
              'price': newProduct.price
            }));
      } catch (error) {
        throw error;
      }
      _items[prodIndex] = newProduct;
    } else {
      print('...');
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = '${this._url.split('.json')[0]}/$id.js';
    var existingProductIndex = _items.indexWhere((element) => element.id == id);
    if (existingProductIndex >= 0) {
      var existingProduct = _items[existingProductIndex];
      _items.removeAt(existingProductIndex);
      notifyListeners();
      try {
        final response = await http.delete(url);
        if (response.statusCode >= 400) {
          _items.insert(existingProductIndex, existingProduct);
          notifyListeners();
          throw HttpException('Could not Delete Product');
        }
        existingProduct = null;
      } catch (error) {
        throw error;
      }
    }
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
