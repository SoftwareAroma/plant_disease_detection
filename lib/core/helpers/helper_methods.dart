import 'package:plant_disease_detection/index.dart';

class HelperMethods {
  HelperMethods._();

  static translate({text, destLang}) async {
    var response = await HelperFunctions.translate(
      data: text,
      sourceLan: "English",
      destLang: destLang,
    );
    return response;
  }
}
