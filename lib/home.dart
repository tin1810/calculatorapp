import 'package:calculatorapp/calcbutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion = '';
  var userAnswer = '';
  List<String> buttons = [
    "ရှင်းမယ်",
    "ဖျက်ပါ",
    "%",
    "/",
    "၇",
    "၈",
    "၉",
    "x",
    "၄",
    "၅",
    "၆",
    "-",
    "၁",
    "၂",
    "၃",
    "+",
    "၀",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "သိပ္ပံနည်းကျဂဏန်းတွက်စက်",
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  ///AC button
                  if (index == 0) {
                    return MyButton(
                      butoonTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.lightBlue[500],
                      textColor: Colors.white,
                    );
                  }

                  ///C button
                  else if (index == 1) {
                    return MyButton(
                      butoonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red[500],
                      textColor: Colors.white,
                    );
                  }

                  ///Equal button
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      butoonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[500],
                      textColor: Colors.black,
                    );
                  }

                  ///ANS button

                  ////Rest of the buttons
                  else {
                    return MyButton(
                      butoonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.orange[500]
                          : Colors.grey[700],
                      textColor: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;

    finalQuestion = finalQuestion.replaceAll('x', '*');

    finalQuestion = finalQuestion.replaceAll('၇', '7');

    finalQuestion = finalQuestion.replaceAll('၈', '8');

    finalQuestion = finalQuestion.replaceAll('၉', '9');

    finalQuestion = finalQuestion.replaceAll('၄', '4');

    finalQuestion = finalQuestion.replaceAll('၅', '5');

    finalQuestion = finalQuestion.replaceAll('၆', '6');

    finalQuestion = finalQuestion.replaceAll('၁', '1');

    finalQuestion = finalQuestion.replaceAll('၂', '2');

    finalQuestion = finalQuestion.replaceAll('၃', '3');

    finalQuestion = finalQuestion.replaceAll('၀', '0');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
