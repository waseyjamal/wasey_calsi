import 'package:calculatorproject_1/calController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:math_expressions/math_expressions.dart';

class MyCalScreen extends StatefulWidget {
  const MyCalScreen({super.key});

  @override
  State<MyCalScreen> createState() => _MyCalScreenState();
}

class _MyCalScreenState extends State<MyCalScreen> {
  var calsiController = Get.put(Calcontroller());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
 
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Color.fromARGB(255, 150, 114, 114)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: size.height / 1 / 2.8,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: const Color.fromARGB(255, 218, 151, 151)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: calsiController.inputController.value,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey,
                                filled: true),
                          ),
                          // Container(

                          //   child: Text(
                          //     input,
                          //     style: TextStyle(fontSize: 30),
                          //   ),
                          // ),
                          //
                          Container(
                            child: Text(
                              calsiController.result.value,
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButtons(context, Color.fromARGB(255, 51, 35, 35), 'AC', size),
                myButtons(
                    context, Color.fromARGB(255, 51, 35, 35), '( )', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), '%', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), '÷', size),
              ],
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '7', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '8', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '9', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), 'X', size),
              ],
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '4', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '5', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '6', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), '-', size),
              ],
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButtons(
                    context, const Color.fromARGB(255, 80, 57, 57), '1', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '2', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '3', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), '+', size),
              ],
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '0', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '.', size),
                myButtons(context, Color.fromARGB(255, 80, 57, 57), '⌫', size),
                myButtons(context, Color.fromARGB(255, 51, 35, 35), '=', size),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }

  InkWell myButtons(BuildContext context, Color color, String value, size) {
    return InkWell(
      highlightColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      splashColor: Colors.white,
      onTap: () {
        calsiController.buttonPressed(value);
      },
      child: Ink(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: size.height / 10.5,
            width: size.width / 5,
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
