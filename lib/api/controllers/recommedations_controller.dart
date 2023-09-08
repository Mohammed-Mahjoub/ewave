import 'dart:convert';
import '../../models/recommendations.dart';
import '../../shared_preferences/shared_preferences.dart';
import '../api_setting.dart';
import 'package:http/http.dart' as http;

class RecommedationsController {
  Future<List<Recommendations>> getAllRecommedations() async {
    var url = Uri.parse(ApiSettings.recommendations);
    print(url);
    var response = await http.get(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    print('xxx' + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Recommendations.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Recommendations>?> getAllRecommedationsPaid(String id) async {
    var url = Uri.parse(ApiSettings.recommendationsPaid + id);
    print('xcxcxcxc' + url.toString());
    var response = await http.get(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    print('xxx' + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Recommendations.fromJson(e)).toList();
    } else if (response.statusCode == 400) {
      return null;
    }
    return [];
  }
}
