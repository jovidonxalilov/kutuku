import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/app_colors.dart';
import 'package:kutuku/features/common/text_widget.dart';

class SplashDetail extends StatelessWidget {
  const SplashDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kutuku,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: "Kutuku",
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w600,
            ),
            TextWidget(
              text: "Any shopping just from home",
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: TextWidget(
            text: "Version 0.0.1",
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
