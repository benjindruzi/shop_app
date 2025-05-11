import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  final VoidCallback onTapDetails;

  ProductTile({
    required this.product,
    required this.onAdd,
    required this.onTapDetails,
  });

  @override
  Widget build(BuildContext c) => ListTile(
    title: Text(product.name),
    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
    trailing: ElevatedButton(
      child: Text('Add'),
      onPressed: onAdd,
    ),
    onTap: onTapDetails,
  );
}
