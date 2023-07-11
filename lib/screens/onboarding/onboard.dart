import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:logi_keep/utils/app_colors.dart';

class Onboarding extends StatelessWidget {
  final Widget image;
  const Onboarding({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 120.h),
      child: image,
    );
  }
}

class Indicator extends StatelessWidget {
  final double position;
  const Indicator({
    super.key,
    required this.position,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 18.h,
        right: 30.w,
      ),
      child: DotsIndicator(
        dotsCount: 3,
        position: position,
        decorator: const DotsDecorator(
          color: kFillText,
          activeColor: kPrimaryBlue,
        ),
      ),
    );
  }
}
