class Product {
  final String name;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.price,
    this.quantity = 0,
  });

  double get subtotal => price * quantity;
}
