import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_detection/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: <Widget>[
                      const OpaqueImage(
                        imageUrl: Assets.imagesProfileIcon,
                      ),
                      SafeArea(
                        child: Container(
                          padding: EdgeInsets.all(5.0.h),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: myProfileText.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  color: BrandColors.kColorWhiteAccent,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const PersonalInfo(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// details
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(top: 70.0.h),
                    margin: EdgeInsets.only(bottom: 20.0.h),
                    color: BrandColors.kColorBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                              child: Column(
                                children: <Widget>[
                                  ProfileItem(
                                    title: "Home",
                                    horizontalPadding: 15.0.w,
                                    onPressed: () {
                                      NavigationService.navigateTo(
                                        navigationMethod: NavigationMethod.push,
                                        page: RoutePaths.homeRoute,
                                        isNamed: true,
                                        // arguments: {"camera": kCameras.first},
                                      );
                                    },
                                  ),
                                  SizedBox(height: 12.0.h),
                                  ProfileItem(
                                    title: "additional help",
                                    horizontalPadding: 15.0.w,
                                    onPressed: () {
                                      NavigationService.navigateTo(
                                        navigationMethod: NavigationMethod.push,
                                        page: RoutePaths.helpRoute,
                                        isNamed: true,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 12.0.h),
                                  ProfileItem(
                                    title: "about",
                                    horizontalPadding: 15.0.w,
                                    onPressed: () {
                                      NavigationService.navigateTo(
                                        navigationMethod: NavigationMethod.push,
                                        page: RoutePaths.aboutRoute,
                                        isNamed: true,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 12.0.h),
                                  BrandDivider(color: BrandColors.kColorDefaultDivider),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// log out button
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: Column(
                            children: <Widget>[
                              CustomOutlineButton(
                                title: signOutText.toUpperCase(),
                                color: BrandColors.kBrandGreen,
                                onPressed: () {
                                  /// authentication flow goes here
                                  ///
                                  /// log out the user and then navigate to the home screen
                                  NavigationService.navigateTo(
                                    navigationMethod: NavigationMethod.push,
                                    page: RoutePaths.homeRoute,
                                    isNamed: true,
                                    arguments: {"camera": kCameras.first},
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /// progress fill
            Positioned(
              top: BrandSizes.screenHeight * (3 / 8) - 80 / 2,
              left: 16.0,
              right: 16.0,
              child: SizedBox(
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ProfileInfoCard(
                      firstText: "84%",
                      secondText: "Success".toUpperCase(),
                    ),
                    SizedBox(width: 10.0.w),
                    const ProfileInfoCard(
                      hasImage: true,
                      imagePath: Assets.imagesPulse,
                    ),
                    SizedBox(width: 10.0.w),
                    ProfileInfoCard(
                      firstText: "02",
                      secondText: "Detections".toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
