import 'package:flutter/material.dart';
class fruit extends StatefulWidget {
  const fruit({super.key});

  @override
  State<fruit> createState() => _fruitState();
}

class _fruitState extends State<fruit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Center(
      child: Text("Want to add data)",
      ),
    ),);
  }
}
