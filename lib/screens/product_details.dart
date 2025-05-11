import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart';

class ProductDetails extends StatelessWidget {
  static const route = '/details';
  @override Widget build(BuildContext ctx) {
    final p = ModalRoute.of(ctx)!.settings.arguments as Product;
    final cart = Cart();
    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text('\$${p.price}', style: TextStyle(fontSize: 24)),
            Spacer(),
            ElevatedButton.icon(
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Add to Cart'),
              onPressed: () {
                cart.add(p);
                ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(content: Text('Added ${p.name}'))
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
