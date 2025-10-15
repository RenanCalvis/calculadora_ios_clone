import 'package:calculadora_ios/pages/CalculatorPage/calculator_controller.dart';
import 'package:calculadora_ios/widgets/CalculatorButton/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculatorController());

    return Scaffold(
      // appBar: AppBar.new,
      backgroundColor: Colors.black,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            // width: double.infinity,
            // color: Colors.red,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(controller.displayValue.toString(), style: TextStyle(color: Colors.white, fontSize: 68, height: 1)),
            )),
          ),
          SizedBox(
            height: 450,
            // color: Colors.blue,
            // width: double.infinity,
            // height: 88,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: controller.buttons.map((row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: row.map((button) {
                      return CalculatorButton(text: button['text'], onPressed: button['onPressed'], color: button['color']);
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
