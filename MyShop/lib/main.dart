import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          ChangeNotifierProvider(create: (ctx) => Orders())
        ],
        child: MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: 'Lato'),
            home: ProductOverviewScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrderScreen.routeName: (ctx) => OrderScreen(),
              UserProductScreen.routeName: (ctx) => UserProductScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen()
            }));
  }
}
