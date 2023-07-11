import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logi_keep/screens/onboarding/onboard.dart';
import 'package:logi_keep/screens/onboarding/onboarding_three.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/text.dart';

class OnboardingTwo extends StatelessWidget {
  static const String route = '/onboarding_two';
  const OnboardingTwo({super.key});

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
              Onboarding(image: Image.asset(Assets.onboardTwoImage)),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5),
                width: 300,
                child: MyText(
                  "Keep track of your customers, goods and orders from your phone.",
                  fontSize: 15.sp,
                  color: kPrimaryText,
                ),
              ),
              Gap(20.h),
              const Indicator(position: 1.0),
              Gap(140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    //width: double.infinity,
                    child: MyText(
                      "Skip",
                      textAlign: TextAlign.start,
                      color: kPrimaryText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingThree()));
                      //Navigator.of(context).pushNamed(OnboardingThree.route);
                    },
                    child: const SizedBox(
                      //width: double.infinity,
                      child: MyText(
                        "Next",
                        textAlign: TextAlign.end,
                        color: kPrimaryText,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
