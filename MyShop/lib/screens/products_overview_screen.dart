import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../providers/products.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;
  var _fetchData = false;
  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (!_fetchData) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Products>(context, listen: false)
            .fetchAndSetProducts();
      } catch (error) {
        print(error);
      }
      setState(() {
        _isLoading = false;
      });
    }
    _fetchData = true;
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorite = true;
                    } else {
                      _showOnlyFavorite = false;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: Text('Only Favorites'),
                          value: FilterOptions.Favorites),
                      PopupMenuItem(
                          child: Text('Show All'), value: FilterOptions.All)
                    ]),
            Consumer<Cart>(
                builder: (_, cart, ch) =>
                    Badge(child: ch, value: cart.itemCount.toString()),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ))
          ],
        ),
        drawer: AppDrawer(),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ProductsGrid(_showOnlyFavorite));
  }
}
