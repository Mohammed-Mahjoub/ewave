import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../fb/fb_notifications.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>  with FbNotifications{
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      print(AppSettingsPreferences.getString(key: PrefKeys.token.name));
      if(AppSettingsPreferences.getString(key: PrefKeys.token.name) == null || AppSettingsPreferences.getString(key: PrefKeys.token.name) == ''){
        Navigator.pushReplacementNamed(context, '/login_screen');
      }else{
        Navigator.pushReplacementNamed(context, '/bn_screen');
      }
    });
    requestNotificationPermissions();
    initializeForegroundNotificationForAndroid(context);
    manageNotificationAction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
