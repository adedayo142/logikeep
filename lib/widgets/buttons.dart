import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/utils/constants.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.enabled = true,
    this.textStyle,
    this.padding,
    this.buttonStyle,
    this.backgroundColor,
    this.textColor,
    this.hasOuterPadding = true,
  });
  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final bool enabled;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? buttonStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hasOuterPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hasOuterPadding ? 34.w : 0),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? kPrimaryBlue,
              disabledForegroundColor: kPrimaryGreen.withOpacity(
                0.38,
              ),
              disabledBackgroundColor: kPrimaryGreen.withOpacity(
                0.38,
              ),
              padding: padding ??
                  EdgeInsets.symmetric(
                    vertical: child != null ? 14.h : 16.h,
                    horizontal: 15.w,
                  ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
        child: Align(
          child: Center(
            child: child ??
                Text(
                  text ?? ' ',
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      kStyleLato.copyWith(
                          color: textColor ?? kPrimaryText,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          height: 24 / 14,
                          letterSpacing: 1.sp),
                ),
          ),
        ),
      ),
    );
  }
}
