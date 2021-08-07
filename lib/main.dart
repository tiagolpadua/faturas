import 'package:flutter/material.dart';

void main() {
  runApp(Faturas());
}

class Faturas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Faturas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sistema de Faturas'),
        ),
        body: const Center(
          child: Text('Olá Mundo!'),
        ),
      ),
    );
  }
}
