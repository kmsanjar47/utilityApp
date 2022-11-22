import 'package:flutter/material.dart';
import 'package:versity/pages/calculator.dart';


class CalcBtn extends StatelessWidget {
  final String btnText;
  final btnTapped;

  const CalcBtn({
    super.key,
    this.btnTapped,
    required this.btnText,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 15, offset: const Offset(4, 4),spreadRadius: 1),
          const BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-4, -4),spreadRadius: 1)
        ],
        color: Colors.grey[300],

        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
          child: TextButton(
            onPressed: btnTapped,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
        ),
        child: Text(btnText),

      )),
    );
  }
}
