import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/widgets/product_tile.dart';
import 'package:shop_app/screens/product_details.dart';
import 'package:shop_app/screens/cart.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cart = Cart();

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      title: Text('Shop'),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () => Navigator.pushNamed(
                context,
                CartScreen.route,
              ).then((_) => setState(() {})),
            ),
            if (cart.itemCount > 0)
              Positioned(
                right: 8, top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${cart.itemCount}',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: cart.products.length,
      itemBuilder: (_, i) {
        final p = cart.products[i];
        return ProductTile(
          product: p,
          onAdd: () => setState(() => cart.add(p)),
          onTapDetails: () => Navigator.pushNamed(
            context,
            ProductDetails.route,
            arguments: p,
          ).then((_) => setState(() {})),
        );
      },
    ),
  );
}
