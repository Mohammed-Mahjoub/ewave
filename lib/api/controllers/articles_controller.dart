import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ewave/models/articles.dart';

import '../../shared_preferences/shared_preferences.dart';
import '../api_setting.dart';

class ArticlesController{

  Future<List<Articles>> getAllArticles() async {
    var url = Uri.parse(ApiSettings.articles);
    var response = await http.get(url,headers:  {
      "Authorization": 'Bearer ${AppSettingsPreferences.getString(key: PrefKeys.token.name)!}',
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Articles.fromJson(e)).toList();
    }
    return [];
  }

}