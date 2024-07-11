import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadialProgress(
            width: 3.0.w,
            goalCompleted: 0.8,
            child: RoundedImage(
              imagePath: Assets.imagesProfileIcon,
              size: Size.fromWidth(100.0.w),
            ),
          ),
          const SizedBox(height: 10.0),
          CustomText(
            text: "Jane Doe".toUpperCase(),
            color: BrandColors.kColorWhiteAccent,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
          SizedBox(height: 10.0.h),
        ],
      ),
    );
  }
}
