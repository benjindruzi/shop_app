import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'confirmation.dart';

class CheckoutScreen extends StatefulWidget {
  static const route = '/checkout';
  @override _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _address = '';
  String? _payment;

  @override Widget build(BuildContext ctx) => Scaffold(
    appBar: AppBar(title: Text('Checkout')),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (v) => _name = v ?? '',
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
            onSaved: (v) => _address = v ?? '',
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Payment Method'),
            items: ['Credit Card','PayPal','Cash on Delivery']
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (v) => _payment = v,
            validator: (v) => v==null ? 'Select one' : null,
          ),
          SizedBox(height: 20),
          Text('Total: \$${Cart().total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18)),
          Spacer(),
          ElevatedButton(
            child: Text('Confirm Order'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(ctx, ConfirmationScreen.route,
                    arguments: {'name': _name, 'address': _address, 'payment': _payment});
              }
            },
          )
        ]),
      ),
    ),
  );
}
