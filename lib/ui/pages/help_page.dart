import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    Assets.imagesCddAppLogo,
                  ),
                  scale: 0.6.h,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 350),
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0.h,
                  horizontal: 10.0.w,
                ),
                decoration: BoxDecoration(
                  color: BrandColors.kBrandGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0.r),
                    topRight: Radius.circular(30.0.r),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25.0.h),
                    AutoSizeText(
                      "Follow RAIL KNUST on all Social media platforms for updates",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: BrandColors.kColorWhiteAccent,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// facebook
                        InkWell(
                          onTap: () async {
                            /// open facebook url
                            HelperFunctions.iLaunchUrl(url: railFacebookUrl);
                          },
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3.0.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: BrandColors.kColorWhiteAccent,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    LineAwesomeIcons.facebook_f,
                                    color: BrandColors.kColorWhiteAccent,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.0.w,
                                  vertical: 2.0.h,
                                ),
                                decoration: BoxDecoration(
                                  color: BrandColors.kColorBackground,
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                child: CustomText(
                                  text: "Rail knust",
                                  color: BrandColors.kBrandGreen,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// twitter
                        InkWell(
                          onTap: () async {
                            /// open twitter url
                            HelperFunctions.iLaunchUrl(url: railTwitterUrl);
                          },
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(3.0.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: BrandColors.kColorWhiteAccent,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    LineAwesomeIcons.twitter,
                                    color: BrandColors.kColorWhiteAccent,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.0.w,
                                  vertical: 2.0.h,
                                ),
                                decoration: BoxDecoration(
                                  color: BrandColors.kColorBackground,
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                child: CustomText(
                                  text: "Rail_knust",
                                  color: BrandColors.kBrandGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0.h),

                    /// linked in
                    InkWell(
                      onTap: () async {
                        /// open linked in url
                        HelperFunctions.iLaunchUrl(url: railLinkedInUrl);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.linkedin_in,
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w,
                                vertical: 2.0.h,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.kColorBackground,
                                borderRadius: BorderRadius.circular(15.0.r),
                              ),
                              child: CustomText(
                                text: "Responsible AI Lab",
                                color: BrandColors.kBrandGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),

                    /// instagram
                    InkWell(
                      onTap: () async {
                        /// open instagram url
                        HelperFunctions.iLaunchUrl(url: railInstagramUrl);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.instagram,
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w,
                                vertical: 2.0.h,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.kColorBackground,
                                borderRadius: BorderRadius.circular(15.0.r),
                              ),
                              child: CustomText(
                                text: "Rail_knust",
                                color: BrandColors.kBrandGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),

                    /// youtube
                    InkWell(
                      onTap: () async {
                        /// open youtube url
                        HelperFunctions.iLaunchUrl(url: railYoutubeUrl);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.youtube,
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w,
                                vertical: 2.0.h,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.kColorBackground,
                                borderRadius: BorderRadius.circular(15.0.r),
                              ),
                              child: CustomText(
                                text: "Responsible AI Lab",
                                color: BrandColors.kBrandGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),

                    /// website
                    InkWell(
                      onTap: () async {
                        /// open website url
                        HelperFunctions.iLaunchUrl(url: railUrl);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.internet_explorer,
                                color: BrandColors.kColorWhiteAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w,
                                vertical: 2.0.h,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.kColorBackground,
                                borderRadius: BorderRadius.circular(15.0.r),
                              ),
                              child: CustomText(
                                text: "www.rail.knust.edu.gh",
                                color: BrandColors.kBrandGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0.h),
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
