import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../fb/fb_notifications.dart';
import '../../widgets/app_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with FbNotifications {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                'assets/splash.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              children: [
                AppButton(
                  text: 'Log in',
                  onPress: ()  {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                ),
                SizedBox(height: 20.h),
                AppButton(
                  text: 'Register',
                  onPress: ()  {
                    Navigator.pushReplacementNamed(context, '/register_screen');
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
