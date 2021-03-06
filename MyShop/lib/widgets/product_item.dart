import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: GestureDetector(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: {'id': product.id});
              },
            ),
            footer: Consumer<Product>(
              builder: (ctx, product, _) => GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                    icon: Icon(product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                    color: Theme.of(context).accentColor),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      cart.addItem(product.id, product.price, product.title);
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Add Item Success"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          action: SnackBarAction(
                            label: 'UNDO',
                            textColor: Colors.white,
                            onPressed: () {
                              cart.removeSingleItem(product.id);
                            },
                          )));
                    },
                    color: Theme.of(context).accentColor),
              ),
            )));
  }
}
