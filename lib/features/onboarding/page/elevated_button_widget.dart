import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/app_colors.dart';
import 'package:kutuku/features/common/text_widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.kutuku,
    this.width = 320,
    this.height = 50,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Center(
          child: TextWidget(
            text: text,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
