import 'package:flutter/material.dart';
import 'package:todoapp/screens/homepage.dart';

void main() {
  runApp(const Todoapp());
}

class Todoapp extends StatelessWidget {
  const Todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo App',
      home: HomePage(),
    );
  }
}
