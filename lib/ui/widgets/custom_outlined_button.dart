import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  const CustomOutlineButton({
    super.key,
    this.title,
    this.onPressed,
    this.color,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color ?? BrandColors.kColorPrimaryDark,
        side: BorderSide(color: color ?? BrandColors.kColorPrimaryDark),
        textStyle: GoogleFonts.poppins(
          color: color ?? BrandColors.kColorPrimaryDark,
          letterSpacing: letterSpacing ?? 1.5,
          fontSize: fontSize ?? 16.0.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0.r),
        ),
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      child: SizedBox(
        height: height ?? 40.0,
        child: Center(
          child: Text(
            title ?? "CLOSE",
            style: GoogleFonts.montserrat(
              fontSize: fontSize ?? 16.0.sp,
              color: color ?? BrandColors.kBrandGreen,
            ),
          ),
        ),
      ),
    );
  }
}
