import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../models/login.dart';
import '../api_setting.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<LogIn?>? logIn(
      {required String email, required String password}) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    var url = Uri.parse(ApiSettings.logIn);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('.........................................');
      var jsonResponse = jsonDecode(response.body);
      LogIn logInUser = LogIn.fromJson(jsonResponse);
      return logInUser;
    }
    return null;
  }

  Future<bool> register({
    required String email,
    required String mobileNumber,
    required String password,
    required String passwordConfirm,
  }) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'email': email,
      'mobile_number': mobileNumber,
      'password': password,
      'passwordConfirm': passwordConfirm,
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201 ) {
      print('.........................................');
      return true;
    }
    return false;
  }

  Future<bool> forgotPassword(
      {required String email}) async {
    var url = Uri.parse(ApiSettings.forgotPassword);
    var response = await http.post(url, body: {
      'email': email,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('.........................................');
      var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['message']);
      return true;
    }
    return false;
  }

  Future<bool> verifyCode(
      {required String email,
      required String code,
      }) async {
    print(code);
    var url = Uri.parse(ApiSettings.verifyCode);
    var response = await http.post(url, body: {
      'email': email,
      'code': code,
    });
    print(response.statusCode);
    var jsonResponse = jsonDecode(response.body);
    print('ccc'+jsonResponse['message']);
    if (response.statusCode == 200) {
      print('.........................................');
      var jsonResponse = jsonDecode(response.body);
        print('ccc'+jsonResponse['message']);
      return true;
    }
    return false;
  }

  Future<bool> resetPassword(
      {required String email,
      required String newPassword,
      }) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      'email': email,
      'newPassword': newPassword,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('.........................................');
      var jsonResponse = jsonDecode(response.body);
      return true;
    }
    return false;
  }
}
