import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Expanded(child: Text("cart"))],
    );
  }
}
