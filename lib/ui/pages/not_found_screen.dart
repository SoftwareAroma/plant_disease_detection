import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({super.key});

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: BrandColors.kBrandWhite,
      body: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LoadingIndicators.instance.smallLoadingAnimation(
                context,
                lottieFile: Assets.lottieNotFound,
                height: BrandSizes.screenHeight * 0.3,
                width: BrandSizes.screenHeight / 0.2,
                repeat: true,
              ),
              SizedBox(height: 20.0.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CustomButton(
                        text: "Go Home".toUpperCase(),
                        onPressed: () {
                          NavigationService.navigateTo(
                            navigationMethod: NavigationMethod.pushReplacement,
                            page: RoutePaths.homeRoute,
                            isNamed: true,
                            // arguments: {"camera": kCameras.first},
                          );
                        },
                        buttonColor: BrandColors.kBrandWhite,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        textColor: BrandColors.kBrandWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
