import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/cart_component.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CartComponent(),
    );
  }
}