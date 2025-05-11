import 'package:flutter/material.dart';
import 'models/cart.dart';
import 'screens/splash.dart';
import 'screens/home.dart';
import 'screens/product_details.dart';
import 'screens/cart.dart';
import 'screens/checkout.dart';
import 'screens/confirmation.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route:       (_) => SplashScreen(),
        HomeScreen.route:         (_) => HomeScreen(),
        ProductDetails.route:     (_) => ProductDetails(),
        CartScreen.route:         (_) => CartScreen(),
        CheckoutScreen.route:     (_) => CheckoutScreen(),
        ConfirmationScreen.route: (_) => ConfirmationScreen(),
      },
    );
  }
}
