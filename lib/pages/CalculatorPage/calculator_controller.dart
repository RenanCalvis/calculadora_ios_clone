import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString displayValue = '0'.obs;

  // static const Color buttonColorOrange = Colors.orange[600]!;
  // static const Color buttonColorGreyDark = Colors.grey[900]!;
  // static const Color buttonColorGreyMedium = Colors.grey[700]!;

  static const Color buttonColorOrange = Color(0xFFF57C00);
  static const Color buttonColorGreyDark = Color(0xFF333333);
  static const Color buttonColorGreyMedium = Color(0xFFA5A5A5);

  late final List<List<Map<String, dynamic>>> buttons;
  @override
  void onInit() {
    super.onInit();

    buttons = [
      [
        {'text': 'AC', 'color': buttonColorGreyMedium, 'onPressed': clean},
        {'text': '+/-', 'color': buttonColorGreyMedium, 'onPressed': () {}},
        {'text': '%', 'color': buttonColorGreyMedium, 'onPressed': () {}},
        {'text': '÷', 'color': buttonColorOrange, 'onPressed': () {}},
      ],
      [
        {'text': '7', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '8', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '9', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '×', 'color': buttonColorOrange, 'onPressed': () {}},
      ],
      [
        {'text': '4', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '5', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '6', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '-', 'color': buttonColorOrange, 'onPressed': () {}},
      ],
      [
        {'text': '1', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '2', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '3', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '+', 'color': buttonColorOrange, 'onPressed': calculate},
      ],
      [
        {'text': '⚙️', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '0', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': ',', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '=', 'color': buttonColorOrange, 'onPressed': () {}},
      ],
    ];
  }

  void clean(){
    displayValue.value = '0';
  }

  void calculate() {
    double sum = double.parse(displayValue.value) + 1;
    displayValue.value = sum.toString();
  }
}
