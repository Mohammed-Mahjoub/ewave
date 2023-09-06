import 'dart:convert';
import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../api_setting.dart';

class SettingsController {
  Future<String> getSettings() async {
    print(AppSettingsPreferences().user().sId!);
    var url = Uri.parse(ApiSettings.settings);
    var response = await http.get(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['data'][0]['privacy'];
    }
    return '';
  }
}
