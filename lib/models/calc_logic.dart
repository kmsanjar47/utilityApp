import 'package:math_expressions/math_expressions.dart';

class CalcLogic{

  var displayQuestion = "0";

  var displayAnswer = "0";

  get userQuestion => displayQuestion;

  get userAnswer => displayAnswer;

  void setQuestion(String question) =>  displayQuestion = question;



  void buttonEqual() {
    String finalQuestion = displayQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval =
    exp.evaluate(EvaluationType.REAL, cm);
    displayAnswer = eval.toString();

  }
  void buttonZero(){
    if (displayQuestion.length == 1) {
      displayQuestion = "0";
    }
    else {
      displayQuestion = displayQuestion.substring(
          0, displayQuestion.length - 1);
    }
  }
  void buttonAC(){
    displayQuestion = "0";
  }
  void buttonC(){
    if (displayQuestion.length == 1) {
      displayQuestion = "0";
    }
    else {
      displayQuestion = displayQuestion.substring(
          0, displayQuestion.length - 1);

    }
  }
  void buttonAns(){
    displayQuestion = displayAnswer;
  }
  void buttonStar(){
    displayQuestion += "*";
  }
 void reset(){
    displayQuestion = "0";
    displayAnswer = "0";
 }

}
