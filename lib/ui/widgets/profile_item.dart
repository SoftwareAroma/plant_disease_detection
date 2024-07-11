import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final double? letterSpacing;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final void Function() onPressed;
  const ProfileItem({
    super.key,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.letterSpacing,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 10.0.w,
          vertical: verticalPadding ?? 8.0.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? BrandColors.kBrandGreen,
          borderRadius: BorderRadius.circular(borderRadius ?? 15.0.r),
        ),
        child: Row(
          children: <Widget>[
            Text(
              title.toTitleCase(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: textColor ?? BrandColors.kBrandWhite,
                fontSize: fontSize ?? 18.0.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
