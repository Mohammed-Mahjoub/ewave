import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

enum PrefKeys {
  language,
  email,
  confCode,
  currency,
  loggedIn,
  token,
  onBoarding
}

class AppSettingsPreferences {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBool({
    required String key,
    required var value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> putDouble({
    required String key,
    required dynamic value,
  }) async {
    return await sharedPreferences!.setDouble(key, value);
  }

  static double? getDouble({
    required String key,
  }) {
    return sharedPreferences!.getDouble(key);
  }

  static Future<bool> putString({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }

  static Future<bool> putInt({required String key, required int value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static int? getInt({required String key}) {
    return sharedPreferences!.getInt(key);
  }

  static void saveUser({required User user}) {
    putString(key: '_id', value: user.sId!);
    putString(key: 'email', value: user.email!);
    putString(key: 'name', value: user.name!);
    putString(key: 'role', value: user.role!);
    putInt(key: 'isPaid', value: user.isPaid!);
    putInt(key: '__v', value: user.iV!);
    putString(key: 'fcm', value: user.fcmToken!);
    putString(key: 'expire_payment', value: user.expire_payment ?? '');
  }

  static void saveToken({required String token}) {
    putString(key: 'token', value: token);
  }

  User user() {
    User user = User();
    user.sId = getString(key: '_id');
    user.email = getString(key: 'email');
    user.name = getString(key: 'name');
    user.role = getString(key: 'role');
    user.isPaid = getInt(key: 'isPaid');
    user.iV = getInt(key: '__v');
    user.fcmToken = getString(key: 'fcm');
    user.expire_payment = getString(key: 'expire_payment');
    return user;
  }
}
