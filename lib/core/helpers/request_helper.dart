import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> getRequest(String link) async {
    Uri url = Uri.parse(link);
    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  static Future<dynamic> postRequest(String link, List<String> data) async {
    Uri url = Uri.parse(link);
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"data": data}),
    );

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        // print("Decoded ${decodedData['data'][0]}");
        return decodedData['data'][0];
      } else {
        debugPrint(response.body.toString());
        return 'failed';
      }
    } catch (e) {
      debugPrint(e.toString());
      return 'failed';
    }
  }
}
