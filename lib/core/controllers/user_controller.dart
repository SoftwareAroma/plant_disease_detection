import 'package:get/get.dart';
import 'package:plant_disease_detection/core/index.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// current active user
  final _user = Rxn<UserModel>();

  /// set current active user
  updateUser(UserModel user) => _user.value = user;

  // check if user is logged in with firebase auth
  bool get isLoggedIn => _user.value != null;

  UserModel? get user => _user.value;
}
