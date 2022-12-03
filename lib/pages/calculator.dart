import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versity/models/calc_logic.dart';
import 'package:versity/utility/CalcBtn.dart';


CalcLogic calculator = CalcLogic();

var calcItem = calculator.getItemList();

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
                  setState(() {
                    calculator.reset();
                  });
                  Navigator.pop(context);
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
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.maxFinite,
                      height: 100,
                      child: Text(
                        calculator.displayQuestion,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 45),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.maxFinite,
                      height: 50,
                      child: Text(
                        calculator.displayAnswer,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
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
                              calculator.buttonAC();
                              //buttonAC
                            }
                            else if (index == 1) {
                              //buttonC
                              calculator.buttonC();
                            }
                            else if (index == 18) {
                              //buttonAns
                              calculator.buttonAns();
                            }
                            else if (index == calcItem.length - 1) {
                              //buttonEqual
                              calculator.buttonEqual();
                            }
                            else if (index == 7) {
                              //buttonStar
                              calculator.buttonStar();
                            }
                            else {
                              if(calculator.displayQuestion != "0") {
                                calculator.setQuestion(
                                    calculator.displayQuestion += calcItem[index][0]);
                              }else{
                                calculator.setQuestion(
                                    calculator.displayQuestion = calcItem[index][0]);
                              }

                            }
                          } catch (e) {
                            calculator.setQuestion("Syntax Error");
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
