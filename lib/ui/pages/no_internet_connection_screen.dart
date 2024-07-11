import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class NoInternetConnection extends StatefulWidget {
  final bool fromSplash;

  const NoInternetConnection({
    this.fromSplash = false,
    super.key,
  });

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      safeAreaBottom: true,
      safeAreaTop: true,
      onWillPop: (val) {
        NavigationService.offAll(
          isNamed: true,
          page: RoutePaths.homeRoute,
        );
        return Future.value(true);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIndicators.instance.smallLoadingAnimation(
            context,
            lottieFile: Assets.lottieConnectionError,
            height: BrandSizes.screenHeight * 0.3,
            width: BrandSizes.screenHeight / 0.2,
            repeat: true,
          ),
          SizedBox(height: BrandSizes.vMarginHigh),
          CustomText(
            text: 'No internet connection',
            textAlign: TextAlign.center,
            color: BrandColors.kColorText,
          ),
          SizedBox(height: BrandSizes.vMarginSmallest),
          const CustomText(
            text: 'Please check your device network',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: BrandSizes.vMarginHigh),
          CustomButton(
            onPressed: () {
              _checkConnectionStatus();
            },
            buttonColor: BrandColors.kPrimaryColor,
            child: CustomText(
              text: 'retry'.toUpperCase(),
              color: Colors.white,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _checkConnectionStatus() {
    ConnectivityService.instance.checkIfConnected().then((value) {
      if (value) {
        if (widget.fromSplash) {
          NavigationService.offAll(
            isNamed: true,
            page: RoutePaths.homeRoute,
          );
        } else {
          Navigator.pop(context);
        }
      } else {
        showCustomFlushBar(
          context: context,
          messageText: "Internet connection not restored",
          backgroundColor: BrandColors.kBrandGreen,
          messageColor: BrandColors.kColorWhiteAccent,
        );
      }
    });
  }
}
