import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/utils/constants.dart';
import 'text.dart';

class DropDownMenuWidget extends StatelessWidget {
  ///DropDownMenuWidget to select an item from a list of items.
  ///itemList and onChanged are required.
  ///When the widget is to be used in a row with another widget, set [isExpanded]
  ///to false and [isDense] to true.
  const DropDownMenuWidget({
    super.key,
    required this.itemList,
    this.value,
    this.padding,
    this.onChanged,
    this.isExpanded = true,
    this.isDense = false,
    this.textStyle,
    this.hint,
    this.boxDecoration,
    this.icon,
    this.fillColor,
    this.label,
    this.hasLabel = true,
    this.controller,
  });

  final List<String> itemList;
  final String? value;
  final EdgeInsetsGeometry? padding;
  final dynamic? onChanged;
  final bool isExpanded;
  final bool isDense;
  final TextStyle? textStyle;
  final String? hint;
  final String? label;
  final BoxDecoration? boxDecoration;
  final Widget? icon;
  final Color? fillColor;
  final bool hasLabel;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: boxDecoration ??
              BoxDecoration(
                color: fillColor ?? kFillText,
                border: Border.all(color: kFillText),
                borderRadius: BorderRadius.circular(12.0),
              ),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(vertical: 13.0.h, horizontal: 16.0.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10.r),
                value: value,
                icon: icon ??
                    SvgPicture.asset(Assets.arrowIconDown,
                        width: 12.w, height: 6.h),
                menuMaxHeight: MediaQuery.of(context).size.height / 2,
                isDense: isDense,
                hint: MyText(
                  hint ?? '',
                  fontWeight: FontWeight.w200,
                  fontSize: 14.0.sp,
                  height: (20.12 / 14.0).sp,
                  color: kPrimaryText,
                ),
                disabledHint: MyText(
                  hint ?? '',
                  fontWeight: FontWeight.w200,
                  fontSize: 14.0.sp,
                  height: (20.12 / 14.0).sp,
                  color: kFillText,
                ),
                onChanged: onChanged,
                isExpanded: isExpanded,
                style: textStyle ?? kStyleLato.copyWith(fontSize: 16.0.sp),
                items: itemList
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: MyText(
                              value,
                            )))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
