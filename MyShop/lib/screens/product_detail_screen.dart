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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  currentProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${currentProduct.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  currentProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              )
            ],
          ),
        ));
  }
}
