import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detection/index.dart';
import 'package:is_first_run/is_first_run.dart';

/// [main] function is the entry point of the application
/// [main] function is an async function
/// initialize all services with [ServiceInitializer]
/// check if the app is running for the first time with [IsFirstRun]
/// if the app is running for the first time, show [SplashPage]
/// else show [HomePage]
///
/// Code Author:
/// Musah Ibrahim Ali
/// Date: 20th August, 2021
/// Email: musahibrahimali@gmail.com
///
///
Future<void> main() async {
  /// ensure all components are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize all settings
  await serviceInitializer.initializeSettings();
  bool firstRun = await IsFirstRun.isFirstRun();
  runApp(MyApp(firstRun: firstRun));
}

class MyApp extends StatelessWidget {
  final bool firstRun;
  const MyApp({
    super.key,
    this.firstRun = true,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          color: BrandColors.kBrandGreen,
          home: firstRun ? const SplashPage() : const HomePage(),
          initialRoute: RoutePaths.boardingRoute,
          onGenerateRoute: LocalNavigator.generateRoute,
        );
      },
    );
  }
}
