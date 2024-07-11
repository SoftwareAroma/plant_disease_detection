import 'package:audioplayers/audioplayers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';

class MeasuresPage extends StatefulWidget {
  const MeasuresPage({
    super.key,
  });

  @override
  State<MeasuresPage> createState() => _MeasuresPageState();
}

class _MeasuresPageState extends State<MeasuresPage> {
  bool _playCauses = false;
  bool _playRecs = false;
  bool _playPrevMeasures = false;

  final AudioPlayer audioPlayer = AudioPlayer();

  String? disease;
  String crop = '';
  String? selectedValue;

  playAudio(audioFile) async {
    ByteData bytes = await rootBundle.load(audioFile); //load sound from assets
    Uint8List soundBytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await audioPlayer.setSourceBytes(soundBytes);
    await audioPlayer.resume();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  disposeAudio() async {
    await audioPlayer.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      recommendationController.changeLangEng();
    });
    if (modelController.predictionModel.toString().contains('Corn (maize) Common rust')) {
      crop = 'maize';
      disease = "Common Rust";
    }
    if (modelController.predictionModel.toString().contains('Corn (maize) healthy')) {
      disease = "Healthy";
      crop = 'maize';
    }
    if (modelController.predictionModel.toString().contains('Tomato Healthy')) {
      crop = 'tomato';
      disease = "Common Healthy";
    }
    if (modelController.predictionModel.toString().contains('Tomato Early blight')) {
      crop = 'tomato';
      disease = "Early Blight";
    }
    if (modelController.predictionModel.toString().contains('Pepper Early blight')) {
      crop = 'pepper';
      disease = "Early Blight";
    }

    DiseaseModel _ = recommendationController.getRecommendation(
      disease: disease ?? modelController.predictionModel.toString(),
      crop: crop,
    );

    recommendationController.changeActiveCropAndDisease(
      crop: crop,
      disease: disease ?? "",
    );

    // print("activeRecommendation: ${activeRecommendation.toJson()}");

    _playCauses = false;
    _playRecs = false;
    _playPrevMeasures = false;
    super.initState();
  }

  @override
  void dispose() {
    _playCauses = false;
    _playRecs = false;
    _playPrevMeasures = false;
    disposeAudio();
    super.dispose();
  }

  Future<DiseaseModel> getRecs() async {
    DiseaseModel recommendation = await recommendationController.getRecommendation(
      disease: disease ?? modelController.predictionModel.toString(),
      crop: crop,
    );
    return recommendation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: FutureBuilder<DiseaseModel>(
            future: getRecs(),
            builder: (BuildContext context, AsyncSnapshot<DiseaseModel> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: CustomText(
                    text: "There was an error loading the recommendation",
                    language: getLanguage(recommendationController.activeLanguage),
                  ),
                );
              }
              return Stack(
                children: <Widget>[
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                      return Obx(
                        () => Column(
                          children: <Widget>[
                            ImageCarousel(
                              height: constraint.maxHeight * 0.26,
                            ),
                            SizedBox(height: 10.0.h),
                            BrandDivider(
                              color: BrandColors.kBrandGreen,
                              height: 2.0.h,
                            ),
                            SizedBox(height: 10.0.h),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: BrandColors.kBrandWhite,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10.0.h),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                          child: Column(
                                            children: <Widget>[
                                              /// Disease
                                              Container(
                                                color: BrandColors.kBrandGreen,
                                                child: Row(
                                                  children: <Widget>[
                                                    const CustomText(
                                                      text: "Disease : ",
                                                      color: Colors.white,
                                                    ),
                                                    CustomText(
                                                      language: getLanguage(recommendationController.activeLanguage),
                                                      text:
                                                          recommendationController.activeRecommendation?.disease ?? "",
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /// causes header
                                              SizedBox(height: 15.0.h),
                                              Container(
                                                color: BrandColors.kBrandGreen,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    const CustomText(
                                                      text: "Causes",
                                                      color: Colors.white,
                                                    ),

                                                    /// play recommendation
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _playCauses = !_playCauses;
                                                        });
                                                        if (_playCauses) {
                                                          playAudio(Assets.soundsTwiOrganicFile);
                                                        } else {
                                                          stopAudio();
                                                        }
                                                      },
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets.symmetric(
                                                              horizontal: 8.0.w,
                                                              vertical: 8.0.w,
                                                            ),
                                                            margin: EdgeInsets.symmetric(
                                                              horizontal: 5.0.w,
                                                              vertical: 5.0.h,
                                                            ),
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kColorWhiteAccent,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                            child: Center(
                                                              child: Icon(
                                                                LineAwesomeIcons.play_circle,
                                                                size: 28.0.w,
                                                                // color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /// Causes
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  if (recommendationController.activeRecommendation!.causes.isEmpty)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 8.0.h,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 5.h,
                                                            width: 5.h,
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kBrandGreen,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0.w),
                                                          Expanded(
                                                            child: CustomText(
                                                              text: "No Known Causes",
                                                              fontSize: 14.0.sp,
                                                              maxLines: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  for (var i = 0;
                                                      i < recommendationController.activeRecommendation!.causes.length;
                                                      i++)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 8.0.h,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 5.h,
                                                            width: 5.h,
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kBrandGreen,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0.w),
                                                          Expanded(
                                                            child: CustomText(
                                                              language:
                                                                  getLanguage(recommendationController.activeLanguage),
                                                              text: recommendationController
                                                                  .activeRecommendation!.causes[i]
                                                                  .toString(),
                                                              fontSize: 14.0.sp,
                                                              maxLines: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                ],
                                              ),

                                              SizedBox(height: 15.0.h),
                                              Container(
                                                color: BrandColors.kBrandGreen,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    const CustomText(
                                                      text: "Recommendations",
                                                      color: Colors.white,
                                                    ),

                                                    /// play Recommendations
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _playRecs = !_playRecs;
                                                        });
                                                        if (_playRecs) {
                                                          playAudio(Assets.soundsTwiOrganicFile);
                                                        } else {
                                                          stopAudio();
                                                        }
                                                      },
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets.symmetric(
                                                              horizontal: 8.0.w,
                                                              vertical: 8.0.w,
                                                            ),
                                                            margin: EdgeInsets.symmetric(
                                                              horizontal: 5.0.w,
                                                              vertical: 5.0.h,
                                                            ),
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kColorWhiteAccent,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                            child: Center(
                                                              child: Icon(
                                                                LineAwesomeIcons.play_circle,
                                                                size: 28.0.w,
                                                                // color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /// organic recommendations
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  const CustomText(
                                                    text: "Organic : ",
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: <Widget>[
                                                        if (recommendationController
                                                            .activeRecommendation!.recommendations.organic.isEmpty)
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                              bottom: 8.0.h,
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  height: 5.h,
                                                                  width: 5.h,
                                                                  decoration: BoxDecoration(
                                                                    color: BrandColors.kBrandGreen,
                                                                    borderRadius: BorderRadius.circular(50.0.r),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 10.0.w),
                                                                Expanded(
                                                                  child: CustomText(
                                                                    text: "No Organic Known Control",
                                                                    fontSize: 14.0.sp,
                                                                    maxLines: 15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        for (var i = 0;
                                                            i <
                                                                recommendationController.activeRecommendation!
                                                                    .recommendations.organic.length;
                                                            i++)
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                              bottom: 8.0.h,
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  height: 5.h,
                                                                  width: 5.h,
                                                                  decoration: BoxDecoration(
                                                                    color: BrandColors.kBrandGreen,
                                                                    borderRadius: BorderRadius.circular(50.0.r),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 10.0.w),
                                                                Expanded(
                                                                  child: CustomText(
                                                                    language: getLanguage(
                                                                        recommendationController.activeLanguage),
                                                                    text: recommendationController.activeRecommendation!
                                                                        .recommendations.organic[i]
                                                                        .toString(),
                                                                    fontSize: 14.0.sp,
                                                                    maxLines: 15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 20.0.h),

                                              /// chemical recommendations
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  const CustomText(
                                                    text: "Chemical : ",
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        for (var i = 0;
                                                            i <
                                                                recommendationController.activeRecommendation!
                                                                    .recommendations.chemical.length;
                                                            i++)
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                              bottom: 8.0.h,
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  height: 5.h,
                                                                  width: 5.h,
                                                                  decoration: BoxDecoration(
                                                                    color: BrandColors.kBrandGreen,
                                                                    borderRadius: BorderRadius.circular(50.0.r),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 10.0.w),
                                                                Expanded(
                                                                  child: CustomText(
                                                                    language: getLanguage(
                                                                        recommendationController.activeLanguage),
                                                                    text: recommendationController.activeRecommendation!
                                                                        .recommendations.chemical[i]
                                                                        .toString(),
                                                                    fontSize: 14.0.sp,
                                                                    maxLines: 15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 15.0.h),

                                              /// preventive measures header
                                              Container(
                                                color: BrandColors.kBrandGreen,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    const CustomText(
                                                      text: "Preventive Measures",
                                                      color: Colors.white,
                                                    ),

                                                    /// play preventive measures
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _playPrevMeasures = !_playPrevMeasures;
                                                        });
                                                        if (_playCauses) {
                                                          playAudio(Assets.soundsTwiOrganicFile);
                                                        } else {
                                                          stopAudio();
                                                        }
                                                      },
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets.symmetric(
                                                              horizontal: 8.0.w,
                                                              vertical: 8.0.w,
                                                            ),
                                                            margin: EdgeInsets.symmetric(
                                                              horizontal: 5.0.w,
                                                              vertical: 5.0.h,
                                                            ),
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kColorWhiteAccent,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                            child: Center(
                                                              child: Icon(
                                                                LineAwesomeIcons.play_circle,
                                                                size: 28.0.w,
                                                                // color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /// preventive measures
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  if (recommendationController
                                                      .activeRecommendation!.preventions.isEmpty)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 8.0.h,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 5.h,
                                                            width: 5.h,
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kBrandGreen,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0.w),
                                                          Expanded(
                                                            child: CustomText(
                                                              text: "No Known preventive measure",
                                                              fontSize: 14.0.sp,
                                                              maxLines: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  for (var i = 0;
                                                      i <
                                                          recommendationController
                                                              .activeRecommendation!.preventions.length;
                                                      i++)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 8.0.h,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 5.h,
                                                            width: 5.h,
                                                            decoration: BoxDecoration(
                                                              color: BrandColors.kBrandGreen,
                                                              borderRadius: BorderRadius.circular(50.0.r),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0.w),
                                                          Expanded(
                                                            child: CustomText(
                                                              text: recommendationController
                                                                  .activeRecommendation!.preventions[i]
                                                                  .toString(),
                                                              fontSize: 14.0.sp,
                                                              maxLines: 15,
                                                              language:
                                                                  getLanguage(recommendationController.activeLanguage),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    /// bottom
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0.w,
                                        vertical: 10.0.h,
                                      ),
                                      width: double.infinity,
                                      color: BrandColors.kBrandGreen,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          CustomOutlineButton(
                                            title: "More Help",
                                            color: BrandColors.kColorWhiteAccent,
                                            onPressed: () {
                                              NavigationService.navigateTo(
                                                navigationMethod: NavigationMethod.push,
                                                page: RoutePaths.helpRoute,
                                                isNamed: true,
                                              );
                                            },
                                          ),

                                          /// select language button
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.translate_outlined,
                                                    size: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 4.0.w),
                                                  Expanded(
                                                    child: Text(
                                                      recommendationController.activeLanguage,
                                                      style: TextStyle(
                                                        fontSize: 12.0.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: recommendationController.languages
                                                  .map((String item) => DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontSize: 12.0.sp,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (value) async {
                                                recommendationController.changeActiveLanguage(value!);
                                                setState(() {
                                                  selectedValue = value;
                                                });
                                                recommendationController.translate();
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                height: 30.0.h,
                                                width: 130.0.w,
                                                padding: EdgeInsets.only(
                                                  left: 4.0.w,
                                                  right: 4.0.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14.0.r),
                                                  border: Border.all(
                                                    color: Colors.greenAccent.withOpacity(0.4),
                                                  ),
                                                  color: BrandColors.kColorLightGreen,
                                                ),
                                                elevation: 0,
                                              ),
                                              iconStyleData: const IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_outlined,
                                                ),
                                                iconSize: 14.0,
                                                iconEnabledColor: Colors.white,
                                                iconDisabledColor: Colors.grey,
                                              ),
                                              dropdownStyleData: DropdownStyleData(
                                                maxHeight: 200.0.h,
                                                width: 120.0.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14),
                                                  color: BrandColors.kBrandGreen,
                                                ),
                                                offset: const Offset(-30, 0),
                                                scrollbarTheme: ScrollbarThemeData(
                                                  radius: const Radius.circular(40),
                                                  thickness: WidgetStateProperty.all(6),
                                                  thumbVisibility: WidgetStateProperty.all(true),
                                                ),
                                              ),
                                              menuItemStyleData: MenuItemStyleData(
                                                height: 25.0.h,
                                                padding: EdgeInsets.only(
                                                  left: 5.w,
                                                  right: 5.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 25.0.h),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  /// back icon
                  Positioned(
                    top: 10.0.h,
                    right: 10.0.w,
                    left: 0.0.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(),
                        InkWell(
                          onTap: () {
                            NavigationService.goBack();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0.w),
                            decoration: BoxDecoration(
                              color: BrandColors.kColorBackground,
                              borderRadius: BorderRadius.circular(50.0.r),
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
                            child: const Icon(LineAwesomeIcons.angle_double_left_solid),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
