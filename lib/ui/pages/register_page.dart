import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_disease_detection/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    userNameController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    _isPasswordVisible = false;
  }

  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    _isPasswordVisible = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesCornOnTheCob,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              duration: const Duration(seconds: 350),
              child: Container(
                height: BrandSizes.screenHeight / 2,
                padding: EdgeInsets.symmetric(
                  horizontal: 35.0.w,
                  vertical: 10.0.h,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: BrandGradients.white,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0.r),
                    topRight: Radius.circular(30.0.r),
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5.0,
                      blurRadius: 8.0,
                      offset: Offset(
                        5.5,
                        -5.0,
                      ),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CustomText(
                        text: signUpText.toUpperCase(),
                        color: BrandColors.kBrandGreen,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                      SizedBox(height: 15.0.h),
                      CustomTextField(
                        controller: userNameController,
                        hintText: userNameHint,
                        focusBorderColor: BrandColors.kBrandGreen,
                        cursorColor: BrandColors.kBrandGreen,
                        textColor: BrandColors.kBrandGreen,
                        hintTextColor: BrandColors.kBrandGreenLight,
                        prefix: Icon(
                          LineAwesomeIcons.user,
                          color: BrandColors.kBrandGreen,
                        ),
                      ),
                      SizedBox(height: 15.0.h),
                      CustomTextField(
                        controller: phoneNumberController,
                        hintText: phoneNumberHint,
                        focusBorderColor: BrandColors.kBrandGreen,
                        cursorColor: BrandColors.kBrandGreen,
                        textColor: BrandColors.kBrandGreen,
                        hintTextColor: BrandColors.kBrandGreenLight,
                        prefix: Icon(
                          LineAwesomeIcons.phone_solid,
                          color: BrandColors.kBrandGreen,
                        ),
                      ),
                      SizedBox(height: 15.0.h),
                      CustomTextField(
                        controller: passwordController,
                        hintText: passwordHint,
                        hintTextColor: BrandColors.kBrandGreenLight,
                        focusBorderColor: BrandColors.kBrandGreen,
                        cursorColor: BrandColors.kBrandGreen,
                        textColor: BrandColors.kBrandGreen,
                        obscureText: !_isPasswordVisible,
                        prefix: Icon(
                          LineAwesomeIcons.lock_solid,
                          color: BrandColors.kBrandGreen,
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
                            color: BrandColors.kBrandGreen,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0.h),
                      CustomButton(
                        text: register.toUpperCase(),
                        textColor: BrandColors.kColorWhiteAccent,
                        buttonColor: BrandColors.kBrandGreen,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0.h,
                        spreadRadius: 4.0,
                        blurRadius: 10.0,
                        yOffset: 0.8,
                        xOffset: 0.5,
                        onPressed: () async {
                          String userName = userNameController.text;
                          String phoneNumber = phoneNumberController.text;
                          String password = passwordController.text;
                          if (password.length < 6) {
                            showCustomFlushBar(
                              context: context,
                              messageText: passwordPrompt,
                              backgroundColor: BrandColors.kBrandGreen,
                              messageColor: BrandColors.kColorWhiteAccent,
                            );
                            return;
                          }
                          if (userName.length < 3) {
                            showCustomFlushBar(
                              context: context,
                              messageText: passwordPrompt,
                              backgroundColor: BrandColors.kBrandGreen,
                              messageColor: BrandColors.kColorWhiteAccent,
                            );
                            return;
                          }
                          if (phoneNumber.length != 10 ||
                              !HelperFunctions.validatePhoneNumber(phoneNumber: phoneNumber)) {
                            showCustomFlushBar(
                              context: context,
                              messageText: invalidPhone,
                              backgroundColor: BrandColors.kBrandGreen,
                              messageColor: BrandColors.kColorWhiteAccent,
                            );
                            return;
                          }

                          /// start internet service
                          await serviceInitializer.initializeConnectivity();
                        },
                      ),
                      SizedBox(height: 15.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CustomText(
                            text: alreadyAccount,
                            color: BrandColors.kColorText,
                            fontSize: 10.0.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 2.0.w),
                          InkWell(
                            onTap: () {
                              NavigationService.navigateTo(
                                navigationMethod: NavigationMethod.pushReplacement,
                                page: RoutePaths.loginRoute,
                                isNamed: true,
                              );
                            },
                            child: CustomText(
                              text: login.toUpperCase(),
                              color: BrandColors.kBrandGreen,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -40.0.h,
              right: -40.0.w,
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  height: 90.0.h,
                  width: 90.0.w,
                  decoration: BoxDecoration(
                    color: BrandColors.kBrandGreen,
                    shape: BoxShape.circle,
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
