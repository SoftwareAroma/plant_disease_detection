import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(
        const Duration(seconds: 10),
        () {
          NavigationService.offAll(
            page: RoutePaths.homeRoute,
            isNamed: true,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesCornOnTheCob),
                    fit: BoxFit.cover,
                    opacity: 0.95,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: BrandColors.kBrandWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0.r),
                    topRight: Radius.circular(20.0.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0.h),
                      LoadingIndicators.instance.smallLoadingAnimation(
                        context,
                        lottieFile: Assets.lottieAiData,
                        height: BrandSizes.screenHeight * 0.3,
                        width: BrandSizes.screenHeight / 0.2,
                        repeat: true,
                      ),
                      SizedBox(height: 35.0.h),
                      CustomText(
                        text: appName.toUpperCase(),
                        fontWeight: FontWeight.w700,
                        color: BrandColors.kBrandGreen,
                        fontSize: 18.0.sp,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35.0.h),
                      CustomButton(
                        text: getStartedText.toUpperCase(),
                        onPressed: () {
                          NavigationService.offAll(
                            page: RoutePaths.homeRoute,
                            isNamed: true,
                          );
                        },
                        buttonColor: BrandColors.kBrandGreen,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.5,
                        textColor: BrandColors.kBrandWhite,
                        fontSize: 18.0.sp,
                      ),
                      SizedBox(height: 25.0.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
