import 'package:plant_disease_detection/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

StateController stateController = StateController.instance;
ModelController modelController = ModelController.instance;
ServiceInitializer serviceInitializer = ServiceInitializer.instance;
RecommendationController recommendationController = RecommendationController.instance;
UserController userController = UserController.instance;
Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
