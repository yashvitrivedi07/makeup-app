import 'dart:typed_data';

class CartModal {
  String? name, description,price;
  Uint8List image;
  int? qty;


  CartModal(
      {this.description,
      this.name,
      this.price,
      this.qty,
      required this.image});

  factory CartModal.toModal(Map m) {
    return CartModal(
        description: m['description'],
        name: m['name'],
        price: m['price'],
        qty: m['qty'],
        image: m['image']);
  }
}
