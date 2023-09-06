import 'dart:convert';
import 'package:ewave/models/videos.dart';
import 'package:http/http.dart' as http;
import '../../shared_preferences/shared_preferences.dart';
import '../api_setting.dart';

class VideosController {
  Future<List<Videos>> getAllVideos() async {
    var url = Uri.parse(ApiSettings.videos);
    var response = await http.get(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Videos.fromJson(e)).toList();
    }
    return [];
  }
  Future<List<Videos>?> getAllVideosPay() async {
    var url = Uri.parse(ApiSettings.videosPay);
    var response = await http.get(url, headers: {
      "Authorization":
          'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Videos.fromJson(e)).toList();
    }else if (response.statusCode == 400) {
      return null;
    }
    return [];
  }
}
