
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:boutique_flutter/providers/cart.dart';
import 'package:boutique_flutter/widgets/cart_item.dart' as cart_item;
import 'package:boutique_flutter/providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        // SizedBox(width: 10),
                        Spacer(),
                        Chip(
                          label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .title!
                                      .color)),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        TextButton(
                          child: Text('ORDER NOW'),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          // textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                            cart.clear();
                          },
                        )
                      ]))),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (ctx, i) => cart_item.CartItem(
                      cart.items.values.toList()[i]!.id,
                      cart.items.keys.toList()[i]!,
                      cart.items.values.toList()[i]!.price,
                      cart.items.values.toList()[i]!.quantity,
                      cart.items.values.toList()[i]!.title),
                  itemCount: cart.itemCount)),
        ],
      ),
    );
  }
}
