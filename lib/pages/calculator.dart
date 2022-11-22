import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:versity/utility/CalcBtn.dart';

import 'home.dart';

var userQuestion = "0";
var userAnswer = "0";
const List calcItem = [
  ["%"], ["C"], ["AC"], ["/"],
  ["7"], ["8"], ["9"], ["x"],
  ["4"], ["5"], ["6"], ["+"],
  ["1"], ["2"], ["3"], ["-"],
  ["."], ["0"], ["ANS"], ["="],
  //text
];

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Icon(
                  CupertinoIcons.back,
                  size: 40,
                ),
              ),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.grey[800]),
              toolbarHeight: 80,
              shadowColor: Colors.black12,
              backgroundColor: Colors.grey[300]),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.maxFinite,
                    height: 100,
                    // decoration: BoxDecoration(
                    //     color: Colors.grey[200],
                    //     boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,offset: Offset(5,5))],
                    //     // border: Border.all(color: Colors.black12, width: 2),
                    //     borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "$userQuestion",
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black, fontSize: 50),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.maxFinite,
                    height: 50,
                    child: Text(
                      "$userAnswer",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: calcItem.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return CalcBtn(
                      btnTapped: () {
                        setState(() {
                          try {
                            if (index == 2) {
                              userQuestion = "0";
                            } else if (index == 1) {
                              if (userQuestion.length == 1) {
                                userQuestion = "0";
                              } else {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              }
                            } else if (index == 18) {
                              userQuestion = userAnswer;
                            } else if (index == calcItem.length - 1) {
                              String finalQuestion = userQuestion;
                              Parser p = Parser();
                              Expression exp = p.parse(finalQuestion);
                              ContextModel cm = ContextModel();
                              double eval =
                                  exp.evaluate(EvaluationType.REAL, cm);
                              userAnswer = eval.toString();
                            } else if (index == 7) {
                              userQuestion += "*";
                            } else {
                              userQuestion += calcItem[index][0];
                            }
                          } catch (e) {
                            userAnswer = "Input Error";
                          }
                        });
                      },
                      btnText: calcItem[index][0],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
