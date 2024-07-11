import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

class SideBarMenuItem extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const SideBarMenuItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor ?? BrandColors.kColorWhiteAccent,
        ),
        title: Text(
          title.toUpperCase(),
          style: GoogleFonts.poppins(
            color: textColor ?? BrandColors.kColorWhiteAccent,
            fontSize: fontSize ?? 12.0.sp,
            letterSpacing: letterSpacing ?? 1.2,
            fontWeight: fontWeight ?? FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
