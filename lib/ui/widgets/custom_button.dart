import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

//Composition works better than inheritance: https://groups.google.com/g/flutter-dev/c/muVUV4z71fs/m/DS0twymQCAAJ
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? minHeight;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? textColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Gradient? gradientColor;
  final BorderRadiusGeometry? gradientBorderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? spreadRadius;
  final double? blurRadius;
  final double? xOffset;
  final double? yOffset;
  final double? letterSpacing;

  const CustomButton({
    this.height,
    this.width,
    this.minHeight,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.gradientColor,
    this.gradientBorderRadius,
    this.padding,
    this.onLongPress,
    super.key,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.spreadRadius,
    this.blurRadius,
    this.xOffset,
    this.yOffset,
    this.letterSpacing,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(splashColor ?? BrandColors.kColorWhiteAccent),
        backgroundColor: WidgetStateProperty.all<Color>(buttonColor ?? BrandColors.kBrandGreen),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  BrandSizes.roundedButtonDefaultRadius,
                ),
              ),
        ),
        elevation: WidgetStateProperty.all<double>(elevation ?? 0.0),
        shadowColor: WidgetStateProperty.all<Color>(shadowColor ?? Colors.black12),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding ?? EdgeInsets.zero), //Not necessary if you added height and width.
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        height: height ?? BrandSizes.roundedButtonDefaultHeight,
        width: width ?? BrandSizes.roundedButtonDefaultWidth,
        constraints: BoxConstraints(
          minHeight: minHeight ?? BrandSizes.roundedButtonMinHeight,
        ),
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ?? BorderRadius.circular(BrandSizes.roundedButtonDefaultRadius),
                gradient: gradientColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: shadowColor ?? Colors.black12,
                    blurRadius: spreadRadius ?? 8.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      xOffset ?? 5.5,
                      yOffset ?? 8.0,
                    ),
                  )
                ],
              )
            : null,
        child: Center(
          child: child ??
              Text(
                text!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: textColor ?? BrandColors.kColorWhiteAccent,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 12.0.sp,
                  letterSpacing: letterSpacing ?? 1.0,
                ),
              ),
        ),
      ),
    );
  }
}
