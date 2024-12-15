import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class Calcontroller extends GetxController {
  Rx<TextEditingController> inputController = TextEditingController().obs;
  RxString result = "".obs;

  void buttonPressed(String value) {
    print(value);

   
      if (value == 'AC') {
        result.value = '';
        inputController.value.text = '';
      } else if (value == '=') {
        result.value = calculateResult(inputController.value.text);
      } else if (value == '⌫') {
        if (inputController.value.text.isNotEmpty) {
          inputController.value.text = inputController.value.text
              .substring(0, inputController.value.text.length - 1);
        }
      } else {
        inputController.value.text += value;
      }
  


  }
  

  String calculateResult(String userInput) {
    try {
      final expression = userInput.replaceAll('X', '*').replaceAll('÷', '/');
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
