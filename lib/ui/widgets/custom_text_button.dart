import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class CustomTextButton extends StatelessWidget {
  final double minHeight;
  final double minWidth;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? textColor;
  final Color? splashColor;
  final Color? shadowColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;
  final MaterialTapTargetSize? tapTargetSize;

  const CustomTextButton({
    this.minHeight = 0,
    this.minWidth = 0,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.padding,
    this.onLongPress,
    this.tapTargetSize,
    super.key,
    this.textColor,
    this.fontWeight,
    this.fontSize,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: splashColor ?? BrandColors.kColorPrimary,
          shape: shape,
          elevation: elevation ?? 0,
          backgroundColor: buttonColor,
          shadowColor: shadowColor,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: BrandSizes.vPaddingTiny,
                horizontal: BrandSizes.hPaddingSmallest,
              ),
          minimumSize: Size(minWidth, minHeight),
          tapTargetSize: tapTargetSize,
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child ??
            CustomText(
              text: text!,
              color: textColor ?? BrandColors.kColorPrimary,
              textAlign: TextAlign.center,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? 22.0.sp,
            ),
      ),
    );
  }
}
