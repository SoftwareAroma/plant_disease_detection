import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;

  const TwoLineItem({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomText(
          text: firstText,
          color: BrandColors.kBrandGreen,
          fontSize: 11.0.sp,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
        CustomText(
          text: secondText,
          color: BrandColors.kBrandGreen,
          fontSize: 10.0.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
