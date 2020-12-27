import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static final routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: Column(children: <Widget>[
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total', style: TextStyle(fontSize: 20)),
                      Spacer(),
                      Chip(
                          label: Text('\$${cart.totalAmount.toString()}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
                                    .color,
                              )),
                          backgroundColor: Theme.of(context).primaryColor),
                      FlatButton(
                        onPressed: () {},
                        child: Text('ORDER NOW'),
                        textColor: Theme.of(context).primaryColor,
                      )
                    ],
                  ))),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) {
              var cartItem = cart.items.values.toList()[index];
              var productId = cart.items.keys.toList()[index];
              return CartItem(cartItem.id, productId, cartItem.price,
                  cartItem.quantity, cartItem.title);
            },
            itemCount: cart.itemCount,
          ))
        ]));
  }
}
