import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as image_lib;
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver, TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      recommendationController.loadRecommendations();
      recommendationController.loadAsanteRecommendations();
      recommendationController.loadAkuapemRecommendations();
      recommendationController.loadEweRecommendations();
      recommendationController.loadHausaRecommendations();
      recommendationController.changeLangEng();
    });
  }

  doSome() async {
    var file = await loadImage();
    logger.d("File Path >>>>>>>> ${file.path}");
    // var image = objectDetection.analyseImage(file.path);

    // image_lib.Image img = convertImage(file);
    // var preds = classifier.predict(img);
    // debugPrint("Predictions >>>>>>>> ${preds.toString()}");
  }

  loadImage() async {
    File file = await modelController.loadImageAsFile(Assets.modelTestImage);
    return file;
  }

  image_lib.Image convertImage(File selectedFile) {
    final File file = selectedFile;
    final image_lib.Image image = image_lib.decodeImage(file.readAsBytesSync())!;
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.kAccentColor,
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: BrandColors.kColorBackground,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 55.0.h),

                      /// select image or take picture
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (modelController.usePicture) {
                              modelController.pickImage(ImageSource.camera);
                            } else {
                              modelController.pickImage(ImageSource.gallery);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: modelController.pickedFile == null
                                  ? BrandColors.kColorDimText.withOpacity(0.6)
                                  : Colors.transparent,
                            ),
                            child: modelController.pickedFile != null
                                ? Image.file(
                                    modelController.pickedFile!,
                                  )
                                : Center(
                                    child: CustomText(
                                      text: !modelController.usePicture ? "Select Image" : "Take a picture",
                                      fontSize: 22.0.sp,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0.h),

                      /// use picture or take picture
                      Center(
                        child: CustomButton(
                          onPressed: () async {
                            if (modelController.usePicture) {
                              modelController.pickImage(ImageSource.camera);
                            } else {
                              modelController.pickImage(ImageSource.gallery);
                            }
                          },
                          text: !modelController.usePicture ? "Select Image" : "Take a picture",
                          fontSize: 16.0.sp,
                        ),
                      ),
                      SizedBox(height: 20.0.h),
                    ],
                  ),
                ),
              ),

              /// change image input button
              if (modelController.usePicture)
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: InkWell(
                    onTap: () async {
                      try {
                        /// the close icon is showing so hide the picture ready panel
                        modelController.reset();
                        modelController.updateUsePicture(value: false);
                      } catch (e) {
                        /// If an error occurs, log the error to the console.
                        debugPrint(e.toString());
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6.0.w),
                          decoration: BoxDecoration(
                            color: BrandColors.kColorBackground,
                            shape: BoxShape.circle,
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5.0,
                                blurRadius: 8.0,
                                offset: Offset(
                                  3.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: !modelController.isPictureReady
                              ? Icon(
                                  LineAwesomeIcons.image,
                                  color: BrandColors.kBrandGreen,
                                  size: BrandSizes.s5,
                                )
                              : Icon(
                                  LineAwesomeIcons.times_solid,
                                  color: BrandColors.kBrandGreen,
                                  size: BrandSizes.s5,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),

              /// change image input button
              if (!modelController.usePicture)
                Positioned(
                    top: 20.0,
                    right: 20.0,
                    child: InkWell(
                      onTap: () async {
                        try {
                          /// the close icon is showing so hide the picture ready panel
                          modelController.reset();
                          modelController.updateUsePicture(value: true);
                        } catch (e) {
                          /// If an error occurs, log the error to the console.
                          debugPrint(e.toString());
                        }
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(6.0.w),
                            decoration: BoxDecoration(
                              color: BrandColors.kColorBackground,
                              shape: BoxShape.circle,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5.0,
                                  blurRadius: 8.0,
                                  offset: Offset(
                                    3.0,
                                    2.0,
                                  ),
                                )
                              ],
                            ),
                            child: !modelController.isPictureReady
                                ? Icon(
                                    LineAwesomeIcons.camera_solid,
                                    color: BrandColors.kBrandGreen,
                                    size: BrandSizes.s5,
                                  )
                                : Icon(
                                    LineAwesomeIcons.times_solid,
                                    color: BrandColors.kBrandGreen,
                                    size: BrandSizes.s5,
                                  ),
                          ),
                        ],
                      ),
                    )),

              /// preview image and process
              if (modelController.isPictureReady)
                Positioned(
                  right: 0.0,
                  left: 0.0,
                  bottom: 0.0,
                  child: Column(
                    children: <Widget>[
                      /// tab with detected crop and diagnosis
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: InkWell(
                          onTap: () {
                            NavigationService.navigateTo(
                              navigationMethod: NavigationMethod.push,
                              page: RoutePaths.measuresRoute,
                              isNamed: true,
                            );
                          },
                          child: modelController.isDetecting ? const PreviewShimmer() : const DetectionPreview(),
                        ),
                      ),
                      SizedBox(height: 15.0.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w,
                        ),
                        decoration: BoxDecoration(
                          color: BrandColors.kBrandGreen,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0.r),
                            topRight: Radius.circular(25.0.r),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15.0.h),
                                  modelController.isDetecting ? const PanelShimmer() : const PanelDetectionPreview(),
                                  SizedBox(height: 35.0.h),

                                  /// navigate to measures page or flag detection
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        /// Recommendation on Measures Page
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              NavigationService.navigateTo(
                                                navigationMethod: NavigationMethod.push,
                                                page: RoutePaths.measuresRoute,
                                                isNamed: true,
                                                arguments: {
                                                  "diseaseName": modelController.predictionModel?.prediction,
                                                },
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 10.0.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: BrandColors.kBrandWhite,
                                                borderRadius: BorderRadius.circular(20.0.r),
                                                boxShadow: const <BoxShadow>[
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 8.0,
                                                    spreadRadius: 5.0,
                                                    offset: Offset(
                                                      0.8,
                                                      5.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "Recommendation",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: BrandColors.kBrandGreen,
                                                  fontSize: 12.0.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.0.w),

                                        /// Flag the Detection
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              /// add the image to a temporary folder, when the user is connected to the internet
                                              /// upload it and delete it from the temporary folder
                                              /// if the user is not connected to the internet, save it to the local database
                                              /// and upload it when the user is connected to the internet

                                              /// save the image to the local database
                                              modelController.flagImage();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 10.0.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: BrandColors.kBrandWhite,
                                                borderRadius: BorderRadius.circular(20.0.r),
                                                boxShadow: const <BoxShadow>[
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 8.0,
                                                    spreadRadius: 5.0,
                                                    offset: Offset(
                                                      0.8,
                                                      5.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "Flag Detection",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: BrandColors.kBrandGreen,
                                                  fontSize: 12.0.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 35.0.h),
                                ],
                              ),
                            ),
                          ],
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

/// Detection preview on main instance
class DetectionPreview extends StatelessWidget {
  const DetectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 8.0.h,
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
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        text: modelController.predictionModel?.prediction ?? "No Disease Detected",
                        maxLines: 5,
                        color: BrandColors.kBrandGreen,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0.sp,
                      ),
                      CustomText(
                        text: "Confidence Score - ${modelController.predictionModel?.confidence ?? 0}%",
                        maxLines: 5,
                        color: BrandColors.kBrandGreen,
                        fontSize: 12.0.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.0.w),
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  decoration: BoxDecoration(
                    color: BrandColors.kBrandGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LineAwesomeIcons.angle_right_solid,
                    color: BrandColors.kColorWhiteAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// panel detection preview
class PanelDetectionPreview extends StatelessWidget {
  const PanelDetectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          text: modelController.predictionModel?.prediction ?? "No Disease Detected",
          maxLines: 5,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w900,
          color: BrandColors.kColorBackground,
        ),
        SizedBox(height: 5.0.h),
        CustomText(
          text: modelController.predictionModel?.confidence != null
              ? "Confidence Score - ${modelController.predictionModel?.confidence ?? 0}%"
              : "",
          maxLines: 5,
          color: BrandColors.kColorWhiteAccent,
          fontWeight: FontWeight.w900,
          fontSize: 14.0.sp,
        ),
      ],
    );
  }
}

/// preview shimmer widget
class PreviewShimmer extends StatelessWidget {
  const PreviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.w,
        vertical: 8.0.h,
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
          )
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        period: const Duration(seconds: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            ),
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// shimmer view for the panel
class PanelShimmer extends StatelessWidget {
  const PanelShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      period: const Duration(seconds: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 40.0,
                  height: 8.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
