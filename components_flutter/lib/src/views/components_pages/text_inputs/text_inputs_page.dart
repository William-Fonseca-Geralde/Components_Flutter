import 'package:flutter/material.dart';

class TextInputsPage extends StatelessWidget {
  const TextInputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          const Text("Text Inputs"),
          const Text("Ola"),
          const Text("Mundo"),
        ],
      ),
    );
  }
}