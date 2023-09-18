import 'dart:convert';
import '../../shared_preferences/shared_preferences.dart';
import '../api_setting.dart';
import 'package:http/http.dart' as http;

class PayController {
  Future<String?>? pay() async {
    var url = Uri.parse(ApiSettings.pay);
    var response = await http.post(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print('.........................................');
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['link']);
      return jsonResponse['link'];
    }
    return null;
  }
  Future<String?>? apple() async {
    var url = Uri.parse(ApiSettings.apple);
    var response = await http.post(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print('.........................................');
      return response.body;
    }
    return null;
  }
}
