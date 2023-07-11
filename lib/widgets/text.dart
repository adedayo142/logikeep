import 'package:flutter/material.dart';
import 'package:logi_keep/utils/constants.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
    this.maxLines,
    this.height,
    this.textAlign,
    this.textDecoration,
    this.decorationColor,
    this.hasShadow = false,
    this.textDirection,
    this.wordSpacing,
    this.shadowColor,
    this.textBaseline,
    this.fontStyle = FontStyle.mulish,
  });

  final String data;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final bool hasShadow;
  final TextDirection? textDirection;
  final double? wordSpacing;
  final Color? shadowColor;
  final TextBaseline? textBaseline;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: true,
      textDirection: textDirection,
      style: fontStyle == FontStyle.mulish
          ? kStyleLato.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              decoration: textDecoration,
              decorationColor: decorationColor,
              height: height,
              wordSpacing: wordSpacing,
              textBaseline: textBaseline,
              shadows: [
                if (hasShadow)
                  Shadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4.0,
                    color: shadowColor ?? Colors.grey.shade700,
                  ),
              ],
            )
          : kStyleLato.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              decoration: textDecoration,
              decorationColor: decorationColor,
              height: height,
              wordSpacing: wordSpacing,
              textBaseline: textBaseline,
              shadows: [
                if (hasShadow)
                  Shadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4.0,
                    color: shadowColor ?? Colors.grey.shade700,
                  ),
              ],
            ),
    );
  }
}

enum FontStyle { mulish }
