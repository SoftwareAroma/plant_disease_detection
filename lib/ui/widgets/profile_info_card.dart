import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class ProfileInfoCard extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool hasImage;
  final String? imagePath;

  const ProfileInfoCard({
    super.key,
    this.firstText,
    this.secondText,
    this.hasImage = false,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: hasImage
            ? Center(
                child: Image.asset(
                  imagePath!,
                  color: BrandColors.kPrimaryColor,
                  width: 25,
                  height: 25,
                ),
              )
            : TwoLineItem(
                firstText: firstText!,
                secondText: secondText!,
              ),
      ),
    );
  }
}
