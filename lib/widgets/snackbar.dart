import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/text.dart';


class CustomSnackBar {
  ///Custom SnackBar in the app. When [child] is null [content] shouldn't be null
  static void showMaterial(
    BuildContext context, {
    String? title,
    String? content,
    Widget? child,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: child ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  MyText(
                    title,
                    fontSize: 14.sp,
                    color: textColor,
                  ),
                if (title != null) Gap(5.h),
                MyText(
                  content ?? '',
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ],
            ),
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        margin: margin ?? EdgeInsets.only(bottom: 80.h),
        duration: duration ?? const Duration(milliseconds: 4500),
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: backgroundColor ?? kPrimaryBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: 8,
      ),
    );
  }


}
