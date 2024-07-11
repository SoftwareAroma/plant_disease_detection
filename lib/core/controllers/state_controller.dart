import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

class StateController extends GetxController {
  static StateController instance = Get.find();

  final _isFirstInstall = true.obs;
  final _showSideBar = true.obs;

  /// update first install
  void checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    _isFirstInstall.value = ifr;
  }

  void checkRoute({required bool sideBar}) {
    _showSideBar.value = sideBar;
  }

  void reset() async {
    await IsFirstRun.reset();
    checkFirstRun();
  }

  bool get isFirstInstall => _isFirstInstall.value;
  bool get showSideBar => _showSideBar.value;
}
