import 'product.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<Product> _products = [
    Product(name: 'Apples', price: 2.5),
    Product(name: 'Bread',  price: 3.0),
    Product(name: 'Milk',   price: 1.75),
  ];

  List<Product> get products => _products;
  List<Product> get inCart   => _products.where((p) => p.quantity > 0).toList();
  int get itemCount          => inCart.fold(0, (sum, p) => sum + p.quantity);
  double get total           => inCart.fold(0, (sum, p) => sum + p.subtotal);

  void add(Product p)              => p.quantity++;
  void remove(Product p)           => p.quantity = 0;
  void changeQty(Product p, int q) => p.quantity = q;
  void clear() {
    for (var p in _products) p.quantity = 0;
  }
}
