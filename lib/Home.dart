import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(text: "7", onButtonclick: onDigitclick),
                  button(text: "8", onButtonclick: onDigitclick),
                  button(text: "9", onButtonclick: onDigitclick),
                  button(text: "/", onButtonclick: onOperatorclick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(text: "4", onButtonclick: onDigitclick),
                  button(text: "5", onButtonclick: onDigitclick),
                  button(text: "6", onButtonclick: onDigitclick),
                  button(text: "*", onButtonclick: onOperatorclick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(text: "1", onButtonclick: onDigitclick),
                  button(text: "2", onButtonclick: onDigitclick),
                  button(text: "3", onButtonclick: onDigitclick),
                  button(text: "+", onButtonclick: onOperatorclick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(text: ".", onButtonclick: onDigitclick),
                  button(text: "0", onButtonclick: onDigitclick),
                  button(text: "=", onButtonclick: onEqualclick),
                  button(text: "-", onButtonclick: onOperatorclick),
                ],
              ),
            ),
          ],
        ));
  }

  void onDigitclick(String text) {
    setState(() {
      result += text;
    });
  }

  String savednumber = '';
  String savedopertor = '';

  void onOperatorclick(String clickedopertor) {
    if (savedopertor.isEmpty) {
      savednumber = result;
      savedopertor = clickedopertor;
      result = '';
      setState(() {});
    } else {
      String RHS = result;
      savednumber = calculate(savednumber, savedopertor, RHS);
      savedopertor = clickedopertor;
      result = '';
      setState(() {});
    }
  }

  void onEqualclick(String _) {
    String RHS = result;
    String res = calculate(savednumber, savedopertor, RHS);
    result = res;
    savednumber = '';
    savedopertor = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (operator == '+') {
      res = n1 + n2;
    } else if (operator == '-') {
      res = n1 - n2;
    } else if (operator == '*') {
      res = n1 * n2;
    } else if (operator == '/') {
      res = n1 / n2;
    }
    return res.toString();
  }
}
