import 'package:math_expressions/math_expressions.dart';

class CalcLogic {

  final List _calcItem = [
    ["%"], ["C"], ["AC"], ["/"],
    ["7"], ["8"], ["9"], ["x"],
    ["4"], ["5"], ["6"], ["+"],
    ["1"], ["2"], ["3"], ["-"],
    ["."], ["0"], ["ANS"], ["="],
  ];

  var displayQuestion = "0";

  var displayAnswer = "0";

  get userQuestion => displayQuestion;

  get userAnswer => displayAnswer;

  List getItemList() => _calcItem;

  void setQuestion(String question) => displayQuestion = question;

  void buttonAC() => displayQuestion = "0";

  void buttonAns() => displayQuestion = displayAnswer;

  void buttonStar() {
    if(displayQuestion != "0") {
      displayQuestion += "*";
    }else{
      displayQuestion = "*";
    }

  }

  void buttonEqual() {
    String finalQuestion = displayQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    displayAnswer = eval.toString();
  }


  void buttonC() {
    if (displayQuestion.length == 1) {
      displayQuestion = "0";
    } else {
      displayQuestion =
          displayQuestion.substring(0, displayQuestion.length - 1);
    }
  }

  void reset() {
    displayQuestion = "0";
    displayAnswer = "0";
  }
}
