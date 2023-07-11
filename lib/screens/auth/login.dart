import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/text.dart';

class LoginView extends StatelessWidget {
   static const String route = '/register_view';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset(Assets.topIconImage)),
                  Gap(50.h),
                  MyText(
                    'Login',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: kPrimaryText,
                  ),
                  Gap(30.h),
              ],
            ),
          ),
        )
      ),
    );
  }
}