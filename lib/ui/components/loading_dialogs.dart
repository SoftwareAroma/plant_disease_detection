import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(BrandColors.kColorDarkGreen),
          ),
        ),
      ),
    ),
  );
}
