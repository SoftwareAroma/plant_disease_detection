import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class OpaqueImage extends StatelessWidget {
  final String imageUrl;
  final Color? color;

  const OpaqueImage({
    super.key,
    required this.imageUrl,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          color: color?.withOpacity(0.85) ?? BrandColors.kBrandGreen.withOpacity(0.85),
        ),
      ],
    );
  }
}
