import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? height;
  final Language language;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.horizontalMargin,
    this.verticalMargin,
    this.height,
    this.language = Language.English,
  });

  @override
  Widget build(BuildContext context) {
    if (language == Language.Asante ||
        language == Language.Akuapem ||
        language == Language.Ewe ||
        language == Language.Hausa) {
      /// custom font
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 5.0,
          vertical: verticalMargin ?? 5.0,
        ),
        child: AutoSizeText(
          text,
          textAlign: textAlign ?? TextAlign.start,
          overflow: overflow,
          maxLines: maxLines ?? 1,
          style: TextStyle(
            fontFamily: 'AndikaNewBasic',
            height: height,
            color: color ?? BrandColors.kColorText,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 22.0.sp,
            letterSpacing: letterSpacing ?? 0.0,
          ),
        ),
      );
    }

    /// default font
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? 5.0,
        vertical: verticalMargin ?? 5.0,
      ),
      child: AutoSizeText(
        text,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow,
        maxLines: maxLines ?? 1,
        style: GoogleFonts.montserrat(
          height: height,
          color: color ?? BrandColors.kColorText,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 22.0.sp,
          letterSpacing: letterSpacing ?? 0.0,
        ),
      ),
    );
  }
}
