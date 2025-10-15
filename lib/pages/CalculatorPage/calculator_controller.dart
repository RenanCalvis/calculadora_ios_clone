import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString displayValue = '0'.obs;

  // static const Color buttonColorOrange = Colors.orange[600]!;
  // static const Color buttonColorGreyDark = Colors.grey[900]!;
  // static const Color buttonColorGreyMedium = Colors.grey[700]!;

  static const Color buttonColorOrange = Color(0xFFFF9F0B);
  static const Color buttonColorGreyDark = Color(0xFF2B2B2D);
  static const Color buttonColorGreyMedium = Color(0xFF5c5c60);

  final List<String> operators = ['÷', '×', '−', '+'];

  late final List<List<Map<String, dynamic>>> buttons;
  @override
  void onInit() {
    super.onInit();

    buttons = [
      [
        {'text': 'AC', 'color': buttonColorGreyMedium, 'onPressed': clean},
        {'text': '+/-', 'color': buttonColorGreyMedium, 'onPressed': () {}},
        {'text': '%', 'color': buttonColorGreyMedium, 'onPressed': () {}},
        {'text': '÷', 'color': buttonColorOrange, 'onPressed': () => setOperator('÷')},
      ],
      [
        {'text': '7', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('7')},
        {'text': '8', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('8')},
        {'text': '9', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('9')},
        {'text': '×', 'color': buttonColorOrange, 'onPressed': () => setOperator('×')},
      ],
      [
        {'text': '4', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('4')},
        {'text': '5', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('5')},
        {'text': '6', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('6')},
        {'text': '−', 'color': buttonColorOrange, 'onPressed': () => setOperator('−')},
      ],
      [
        {'text': '1', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('1')},
        {'text': '2', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('2')},
        {'text': '3', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('3')},
        {'text': '+', 'color': buttonColorOrange, 'onPressed': () => setOperator('+')},
      ],
      [
        {'text': '⚙️', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '0', 'color': buttonColorGreyDark, 'onPressed': () => setNumber('0')},
        {'text': ',', 'color': buttonColorGreyDark, 'onPressed': () {}},
        {'text': '=', 'color': buttonColorOrange, 'onPressed': () => showResult()},
      ],
    ];
  }

  void clean() {
    displayValue.value = '0';
  }

  void calculate() {
    double sum = double.parse(displayValue.value) + 1;
    displayValue.value = sum.toString();
  }

  void setNumber(String number) {
    if (displayValue.value == '0') {
      displayValue.value = number;
    } else {
      displayValue.value += number;
    }
  }

  void setOperator(String operator) {
    if (operators.any((op) => displayValue.value.endsWith(op))) {
      if (displayValue.value[displayValue.value.length - 1] != operator) {
        displayValue.value = displayValue.value.substring(0, displayValue.value.length - 1) + operator;
      }
    } else {
      displayValue.value += operator;
    }
  }

  void showResult(){
    List<String> parts = [];
    String currentPart = '';
    final pattern = RegExp(r'(\d+(\.\d+)?|[÷×−+])');
    // parts = displayValue.value.split(RegExp(r'[÷×−+]'));
    final matches = pattern.allMatches(displayValue.value);
    parts = matches.map((match) => match.group(0)!).toList();
    //TODO: Implementar lógica de calculo com arvores algebricas
    print(matches.toList());
    print(parts);
    double result = 0;

  }
}
