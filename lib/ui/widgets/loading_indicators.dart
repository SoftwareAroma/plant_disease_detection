import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_disease_detection/index.dart';

class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
    bool? repeat,
    required dynamic lottieFile,
  }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          lottieFile,
          height: height ?? BrandSizes.loadingAnimationDefaultHeight,
          width: width ?? BrandSizes.loadingAnimationDefaultWidth,
          repeat: repeat ?? false,
        ),
      ),
    );
  }
}
