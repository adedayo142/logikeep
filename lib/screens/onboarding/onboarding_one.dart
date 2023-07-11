import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logi_keep/screens/auth/register.dart';
import 'package:logi_keep/screens/onboarding/onboard.dart';
import 'package:logi_keep/screens/onboarding/onboarding_two.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/text.dart';

class OnBoardingOne extends StatelessWidget {
  static const String route = '/onboarding_one';
  const OnBoardingOne({super.key});

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
                  margin: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Image.asset(Assets.topIconImage)),
              Onboarding(image: Image.asset(Assets.onboardOneImage)),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5),
                width: 300,
                child: MyText(
                  "Take stock and upload new products from the comfort of your home or office.",
                  fontSize: 15.sp,
                  color: kPrimaryText,
                ),
              ),
              Gap(20.h),
              const Indicator(position: 0.0),
              Gap(140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterView.route);
                    },
                    child: const SizedBox(
                      //width: double.infinity,
                      child: MyText(
                        "Skip",
                        textAlign: TextAlign.start,
                        color: kPrimaryText,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingTwo()));
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
