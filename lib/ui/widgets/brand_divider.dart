import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class BrandDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  const BrandDivider({
    super.key,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1.0,
      color: color ?? BrandColors.kColorDefaultDivider,
      thickness: 1.0,
    );
  }
}
