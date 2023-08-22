import 'package:flutter/material.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Expanded(child: Text("person"))],
    );
  }
}
