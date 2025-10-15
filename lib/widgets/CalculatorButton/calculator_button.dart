import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const CalculatorButton({super.key, required this.text, this.color = Colors.grey, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color, shape: CircleBorder(), padding: EdgeInsets.zero, fixedSize: Size(80, 80)),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 36)),
    );
  }
}
