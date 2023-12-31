import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
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
      Navigator.pushReplacementNamed(context, '/bn_screen');
    });
    requestNotificationPermissions();
    initializeForegroundNotificationForAndroid(context);
    manageNotificationAction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}