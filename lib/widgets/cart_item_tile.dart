import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String name;
  final double price;

  CartItemTile({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Text('\$${price.toStringAsFixed(2)}'),
    );
  }
}
