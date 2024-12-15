import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caculator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              myButtons(context, '1'),
              myButtons(context, '2'),
              myButtons(context, '3'),
              myButtons(context, '+'),
            ],
          ),
          Row(
            children: [
              myButtons(context, '4'),
              myButtons(context, '5'),
              myButtons(context, '6'),
              myButtons(context, '-'),
            ],
          ),
          Row(
            children: [
              myButtons(context, '7'),
              myButtons(context, '8'),
              myButtons(context, '9'),
              myButtons(context, 'X'),
            ],
          ),
          Row(
            children: [
              myButtons(context, '.'),
              myButtons(context, '0'),
              myButtons(context, '='),
              myButtons(context, '/'),
              myButtons(context, 'C'),
            ],
          ),
          Container(
            child: Text(
              input,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            child: Text(
              'result :' + result,
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }

  InkWell myButtons(BuildContext context, String value) {
    return InkWell(
      onTap: () {
        buttonPressed(value);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(value),
          decoration: BoxDecoration(color: Colors.grey),
        ),
      ),
    );
  }

  void buttonPressed(String value) {
    print(value);
    setState(() {
      if (value == 'C') {
        result = '';
        input = '';
      } else if (value == '=') {
        result = calculateResult(input);
      } else {
        input += value;
      }
    });
  }

  String calculateResult(String userInput) {
    try {
      final expression = userInput.replaceAll('X', '*');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval.toString();
    } catch (e) {
      return 'error';
    }
  }
}