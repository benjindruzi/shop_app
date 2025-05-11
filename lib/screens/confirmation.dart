import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'home.dart'; // ← add this

class ConfirmationScreen extends StatelessWidget {
  static const route = '/confirmation';

  @override
  Widget build(BuildContext ctx) {
    final args    = ModalRoute.of(ctx)!.settings.arguments as Map;
    final name    = args['name'];
    final payment = args['payment'];
    final total   = Cart().total;
    Cart().clear();

    return Scaffold(
      appBar: AppBar(title: Text('Thank You!')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 16),
            Text('Thanks, $name!', style: TextStyle(fontSize: 24)),
            Text('Payment: $payment'),
            SizedBox(height: 16),
            Text('Your order of \$${total.toStringAsFixed(2)} is confirmed.'),
            Spacer(),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  ctx, HomeScreen.route, (r) => false),
            ),
          ],
        ),
      ),
    );
  }
}
