import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.line = 1,
    this.color = Colors.black,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final Color color;
  final int line;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: line,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}