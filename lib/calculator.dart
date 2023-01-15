// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numberButton(String btntext, Color btnColor, Color textColor) {
    return ElevatedButton(
      onPressed: () => {calculate(btntext)},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
        backgroundColor: btnColor,
      ),
      child: Text(
        btntext,
        style: TextStyle(fontSize: 25, color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text('Calculator'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton('C', Colors.grey, Colors.black),
                numberButton('+/-', Colors.grey, Colors.black),
                numberButton('%', Colors.grey, Colors.black),
                numberButton('/', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton('7', Colors.grey, Colors.black),
                numberButton('8', Colors.grey, Colors.black),
                numberButton('9', Colors.grey, Colors.black),
                numberButton('*', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton('4', Colors.grey, Colors.black),
                numberButton('5', Colors.grey, Colors.black),
                numberButton('6', Colors.grey, Colors.black),
                numberButton('-', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton('1', Colors.grey, Colors.black),
                numberButton('2', Colors.grey, Colors.black),
                numberButton('3', Colors.grey, Colors.black),
                numberButton('+', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton('^', Colors.grey, Colors.black),
                numberButton('0', Colors.grey, Colors.black),
                numberButton('.', Colors.grey, Colors.black),
                numberButton('=', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // logic part
  int firstnum = 0;
  int secondnum = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstnum = 0;
      secondnum = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/" ||
        btnText == "^") {
      firstnum = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondnum = int.parse(text);
      if (operation == "+") {
        result = (firstnum + secondnum).toString();
      }
      if (operation == "-") {
        result = (firstnum - secondnum).toString();
      }
      if (operation == "*") {
        result = (firstnum * secondnum).toString();
      }
      if (operation == "/") {
        result = (firstnum / secondnum).toString();
      }
      if (operation == "^") {
        result = (firstnum * firstnum).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }
}
