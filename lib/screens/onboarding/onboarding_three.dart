import 'package:flutter/material.dart';
import 'package:logi_keep/screens/auth/register.dart';
import 'package:logi_keep/screens/onboarding/onboard.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/buttons.dart';
import 'package:logi_keep/widgets/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnboardingThree extends StatelessWidget {
  static const String route = '/onboarding_three';
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 25.0.w),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.asset(Assets.topIconImage)),
              Onboarding(image: Image.asset(Assets.onboardThreeImage)),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5),
                width: 300,
                child: MyText(
                  "Receive automatic updates and know when your stocks are almost finished.",
                  fontSize: 15.sp,
                  color: kPrimaryText,
                ),
              ),
              Gap(20.h),
              const Indicator(position: 2.0),
              Gap(100.h),
              Padding(
                padding: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 25.h),
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterView.route);
                  },
                  backgroundColor: kPrimaryBlue,
                  textColor: Colors.white,
                  text: 'GET STARTED',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
