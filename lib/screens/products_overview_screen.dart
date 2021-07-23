import 'package:flutter/material.dart';

import 'package:boutique_flutter/widgets/products_grid.dart';
import 'package:boutique_flutter/providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('Boutique'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showFavoritesOnly = true;
                  } else {
                    _showFavoritesOnly = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                    child: Text('Show All'), value: FilterOptions.All),
              ],
            ),
            Consumer<Cart>(
              builder: (_x, cartData, ch) => Badge(
                  key: DateTime.now().toString() as Key,
                  child: ch as Widget,
                  value: cartData.itemCount.toString(),
                  color: Colors.blueAccent),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: ProductsGrid(_showFavoritesOnly));
  }
}
