import 'package:flutter/material.dart';
import 'package:versity/pages/calculator.dart';
import 'package:versity/pages/converter.dart';

class ContentBox extends StatelessWidget {
  final String iconPath;
  final String contentName;

  const ContentBox({
    super.key,
    required this.iconPath,
    required this.contentName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.black,
        onTap: () {
          if (contentName == "Calculator") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Calculator()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Converter()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500, blurRadius: 15, offset: Offset(4, 4),spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white, blurRadius: 15, offset: Offset(-4, -4),spreadRadius: 1.0)
              ],
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              ),
          height: 20,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                contentName,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 7,
              ),
              Image.asset(iconPath),
            ],
          ),
        ),
      ),
    );
  }
}
