import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detection/index.dart';

class ServiceInitializer {
  ServiceInitializer._();
  static final ServiceInitializer instance = ServiceInitializer._();

  /// initialize settings
  initializeSettings() async {
    await initializeDataLayer();
    initializeOrientationPreferences();
    await initFirebase();
    await startServices();
    // await initializeConnectivity();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> startServices() async {
    /// check if it's first install
    stateController.checkFirstRun();
  }

  /// initialize data layer
  initializeDataLayer() async {
    Get.lazyPut(() => StateController());
    Get.lazyPut(() => ModelController());
    Get.lazyPut(() => RecommendationController());
    Get.lazyPut(() => UserController());
  }

  /// initialize connectivity
  initializeConnectivity() async {
    await ConnectivityService.instance.initializeConnectivityListeners();
    ConnectivityService.instance.checkIfConnected().then(
      (bool value) {
        NavigationService.navigateTo(
          isNamed: true,
          navigationMethod: NavigationMethod.push,
          page: RoutePaths.coreNoInternet,
          arguments: {'fromSplash': false},
        );
      },
    );
  }

  /// initialize orientation preferences
  initializeOrientationPreferences() {
    /// handle display orientation on various devices
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// system ui mode
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }
}
