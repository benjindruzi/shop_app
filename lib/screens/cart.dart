import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/screens/checkout.dart';

class CartScreen extends StatefulWidget {
  static const route = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cart = Cart();

  @override
  Widget build(BuildContext ctx) {
    final items = cart.inCart;

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: items.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView(
        children: items.map((p) {
          return ListTile(
            title: Text(p.name),
            subtitle: Text('Subtotal: \$${p.subtotal.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() {
                    if (p.quantity > 1) {
                      cart.changeQty(p, p.quantity - 1);
                    } else {
                      cart.remove(p);
                    }
                  }),
                ),
                Text('${p.quantity}'),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() {
                    cart.changeQty(p, p.quantity + 1);
                  }),
                ),
              ],
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Total: \$${cart.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              child: Text('Checkout'),
              onPressed: items.isEmpty
                  ? null
                  : () => Navigator.pushNamed(ctx, CheckoutScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}
