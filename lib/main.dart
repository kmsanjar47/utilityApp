import 'package:flutter/material.dart';
import 'package:versity/pages/home.dart';

List Myitems = [
  ["Calculator", "assets/icons/calculator.png"],
  ["Converter", "assets/icons/converter.png"]
];

void main() {
  runApp(const UtilityApp());
}

class UtilityApp extends StatelessWidget {
  const UtilityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
