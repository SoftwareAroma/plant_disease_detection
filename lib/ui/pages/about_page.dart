import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/index.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 25.0.h),

            /// about text
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
                vertical: 10.0.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 5.0.h,
              ),
              decoration: BoxDecoration(
                color: BrandColors.kColorBackground,
                borderRadius: BorderRadius.circular(15.0.r),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5.0,
                    blurRadius: 8.0,
                    offset: Offset(
                      3.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: AutoSizeText(
                  aboutPlantDetectionApp,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: BrandColors.kBrandGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
            ),

            /// partners
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0.h,
                horizontal: 20.0.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      Assets.imagesRailPartners,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0.h)
          ],
        ),
      ),
    );
  }
}
