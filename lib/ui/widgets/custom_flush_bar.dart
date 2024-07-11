import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';

Future<dynamic> showCustomFlushBar({
  required context,
  String? messageText,
  String? title,
  String? message,
  Color? backgroundColor,
  Color? titleColor,
  Color? iconColor,
  Color? messageColor,
  double? iconSize,
  double? messageSize,
  double? titleSize,
  IconData? icon,
  Widget? titleText,
  Duration? duration,
  bool shouldIconPulse = true,
  double borderWidth = 1.0,
  Color? borderColor,
  BorderRadius? borderRadius,
  EdgeInsets padding = const EdgeInsets.all(16.0),
  EdgeInsets margin = const EdgeInsets.all(0.0),
  FlushbarPosition flushbarPosition = FlushbarPosition.TOP,
  FlushbarStyle flushbarStyle = FlushbarStyle.FLOATING,
}) {
  return Flushbar(
    title: title,
    message: message,
    flushbarPosition: flushbarPosition,
    flushbarStyle: flushbarStyle,
    messageText: messageText != null
        ? Center(
            child: CustomText(
              text: messageText,
              color: messageColor ?? BrandColors.kColorWhiteAccent,
              maxLines: 3,
            ),
          )
        : null,
    titleSize: titleSize ?? 18.0.sp,
    titleColor: titleColor ?? BrandColors.kColorWhiteAccent,
    backgroundColor: backgroundColor ?? BrandColors.kColorPrimary,
    messageColor: messageColor ?? BrandColors.kGrayWhite,
    shouldIconPulse: shouldIconPulse,
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    margin: margin,
    padding: padding,
    icon: Icon(
      icon ?? LineAwesomeIcons.exclamation_circle_solid,
      color: iconColor ?? BrandColors.kColorWhiteAccent,
      size: iconSize,
    ),
    duration: duration ?? const Duration(seconds: 5),
  ).show(context);
}
