import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/app_colors.dart';
import 'package:kutuku/features/common/text_widget.dart';
import 'package:kutuku/features/onboarding/page/elevated_button_widget.dart';

class OnboardingDetail extends StatelessWidget {
  const OnboardingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: PageView(
                // controller: PageController(viewportFraction: 0.9),
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/onboarding1.jpg',
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "Various Collections Of The Latest Products",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                        text:
                            "Urna amet, suspendisse ullamcorpper ac elit diam facilisis sursus vestibulum.",
                        color: Colors.black26,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/onboarding2.jpg',
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "Various Collections Of The Latest Products",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                        text:
                            "Urna amet, suspendisse ullamcorpper ac elit diam facilisis sursus vestibulum",
                        color: Colors.black26,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/onboarding3.jpg',
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "Various Collections Of The Latest Products",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                        text:
                            "Urna amet, suspendisse ullamcorpper ac elit diam facilisis sursus vestibulum",
                        color: Colors.black26,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        line: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          children: [
            ElevatedButtonWidget(text: "Create Account",),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              text: "Already Have an Account",
              color: AppColors.kutuku,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
