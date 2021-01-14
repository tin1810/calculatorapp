import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final butoonTapped;
  MyButton({this.color, this.textColor, this.buttonText, this.butoonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: butoonTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Container(
            height: 12,
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor, fontSize: 20, fontFamily: 'Tagu'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
