import 'dart:convert';

import 'package:azkar/api/api_settings.dart';
import 'package:http/http.dart' as http;

class ApiTimingsByCityController {
  Future<Map<String, dynamic>> getData(
      {required String coName, required String ciName}) async {
    var url = Uri.parse(
        '${ApiSettings.TIMINGBYCITY}?city=$coName&country=$ciName&method=8');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'];
      return jsonArray;
    } else if (response.statusCode == 400) {
    } else {
      print('error in api');
    }
    return {};
  }
}
