import 'package:plant_disease_detection/index.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  /// get current date
  static Future<String> currentDate() async {
    DateTime dateTime = DateTime.now();
    return dateTime.toString();
  }

  /// get current year
  static String getCurrentYear() {
    DateTime dateTime = DateTime.now();
    String year = dateTime.year.toString();
    return year;
  }

  /// launch url
  static Future<void> iLaunchUrl({required String url}) async {
    /// convert the url to a Uri
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  static bool validatePhoneNumber({required String phoneNumber}) {
    if (phoneNumber.length != 10) {
      return false;
    } else {
      var number = double.tryParse(phoneNumber);

      /// if the number is a number then proceed
      if (number.runtimeType == double) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<dynamic> translate({required String data, required String sourceLan, required String destLang}) async {
    const apiLink = "https://hnmensah-ghanaian-language-translator.hf.space/api/predict";

    // Convert the data to the required format
    List<String> requestBody = [sourceLan, destLang, data];

    var response = await RequestHelper.postRequest(apiLink, requestBody);
    return response;
  }
}
