import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static final routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final Product currentProduct =
        Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentProduct.title),
      ),
      body: Center(
        child: Text(currentProduct.title),
      ),
    );
  }
}
