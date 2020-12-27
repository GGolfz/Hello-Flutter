import 'package:flutter/material.dart';

import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Shop',
        'icon': Icons.shop,
        'routeName': '/',
      },
      {
        'title': 'Orders',
        'icon': Icons.payment,
        'routeName': OrderScreen.routeName,
      },
      {
        'title': 'Manage Products',
        'icon': Icons.edit,
        'routeName': UserProductScreen.routeName,
      },
    ];
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Hello Friend!'),
          automaticallyImplyLeading: false,
        ),
        ...ListTile.divideTiles(context: context, tiles: [
          ...items.map((el) => ListTile(
                leading: Icon(el['icon']),
                title: Text(el['title']),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(el['routeName']);
                },
              ))
        ]),
      ]),
    );
  }
}
