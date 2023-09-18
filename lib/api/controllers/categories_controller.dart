import 'dart:convert';
import 'package:ewave/models/categories.dart';
import 'package:http/http.dart' as http;
import '../../shared_preferences/shared_preferences.dart';
import '../api_setting.dart';

class CategoriesController {
  Future<List<Categories>> getAllCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url);
    print('xxx' + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      var datajson = jsonResponse['data'] as List;
      return datajson.map((e) => Categories.fromJson(e)).toList();
    }
    return [];
  }
}

