import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final Duration _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
  }

  void _onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (BuildContext context, AsyncSnapshot<bool> isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -BrandSizes.screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : BrandSizes.screenWidth - 39,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    color: BrandColors.kBrandGreen,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.h),

                        /// side bar head
                        InkWell(
                          onTap: () {
                            _onIconPressed();
                            NavigationService.navigateTo(
                              navigationMethod: NavigationMethod.push,
                              page: RoutePaths.profileRoute,
                              isNamed: true,
                            );
                          },
                          child: ListTile(
                            title: Text(
                              "RAIL",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20.0.h,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            subtitle: Text(
                              "Responsible AI Lab",
                              style: GoogleFonts.poppins(
                                color: BrandColors.kAccentColor,
                                fontSize: 16.0.h,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 25.0.r,
                              backgroundImage: const AssetImage(Assets.imagesProfileIcon),
                            ),
                          ),
                        ),

                        /// divider
                        Divider(
                          height: 4,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),

                        /// home page
                        SideBarMenuItem(
                          title: "home",
                          onPressed: () {
                            _onIconPressed();
                            NavigationService.navigateTo(
                              navigationMethod: NavigationMethod.push,
                              page: RoutePaths.homeRoute,
                              isNamed: true,
                            );
                          },
                          icon: LineAwesomeIcons.home_solid,
                        ),
                        SizedBox(height: 2.0.h),

                        /// about the app
                        SideBarMenuItem(
                          title: "About",
                          onPressed: () {
                            _onIconPressed();
                            NavigationService.navigateTo(
                              navigationMethod: NavigationMethod.push,
                              page: RoutePaths.aboutRoute,
                              isNamed: true,
                            );
                          },
                          icon: LineAwesomeIcons.info_circle_solid,
                        ),
                        SizedBox(height: 2.0.h),

                        /// privacy policy
                        SideBarMenuItem(
                          title: "Privacy policy",
                          onPressed: () {
                            _onIconPressed();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyWebView(selectedUrl: privacyPolicyUrl),
                              ),
                            );
                          },
                          icon: LineAwesomeIcons.user_check_solid,
                        ),
                        SizedBox(height: 10.0.h),

                        /// divider
                        Divider(
                          height: 4.0,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32.0,
                          endIndent: 32.0,
                        ),
                        Expanded(child: Container()),

                        /// active user
                        InkWell(
                          onTap: () {
                            _onIconPressed();
                            NavigationService.navigateTo(
                              navigationMethod: NavigationMethod.push,
                              page: RoutePaths.loginRoute,
                              isNamed: true,
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  Assets.imagesProfileIcon,
                                ),
                              ),
                              SizedBox(width: 15.0.w),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Sign In",
                                      style: GoogleFonts.poppins(
                                        color: BrandColors.kColorWhiteAccent,
                                      ),
                                    ),
                                    Icon(
                                      LineAwesomeIcons.angle_double_right_solid,
                                      color: BrandColors.kColorWhiteAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// other info
                        SizedBox(height: 25.0.h),

                        /// copyright
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () async {
                                    _onIconPressed();
                                    HelperFunctions.iLaunchUrl(url: railUrl);
                                  },
                                  child: Text(
                                    railUrlName,
                                    style: GoogleFonts.poppins(
                                      color: BrandColors.kColorWhiteAccent,
                                      fontSize: 12.0.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Text(
                              "$orgName - $copyrightSymbol Copyright ${HelperFunctions.getCurrentYear()}".toUpperCase(),
                              style: GoogleFonts.poppins(
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15.0.h),
                      ],
                    ),
                  ),
                ),

                /// open and close drawer and container
                Align(
                  alignment: const Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () => _onIconPressed(),
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35.0,
                        height: 110.0,
                        color: BrandColors.kBrandGreen,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: BrandColors.kColorWhiteAccent,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
