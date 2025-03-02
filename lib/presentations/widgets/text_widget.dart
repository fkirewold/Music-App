import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
 final String text;
 final Color? color;
 final double? fontSize;
 final FontWeight? fontWeight;
  const TextWidget({super.key, required this.text, this.color, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),

    );
  }
}