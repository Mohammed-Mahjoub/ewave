import 'package:ewave/screens/auth/enter_email_screen.dart';
import 'package:ewave/screens/auth/login_screen.dart';
import 'package:ewave/screens/auth/register_screen.dart';
import 'package:ewave/screens/bn_screens/bottom_navigation_screen.dart';
import 'package:ewave/screens/bn_screens/drower/pay_screen.dart';
import 'package:ewave/screens/bn_screens/drower/privacy_policy_screen.dart';
import 'package:ewave/screens/bn_screens/paid_recommendation/video_pay_screen.dart';
import 'package:ewave/screens/start_screen/launch_screen.dart';
import 'package:ewave/screens/start_screen/start_screen.dart';
import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:purchases_flutter/models/purchases_configuration.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
import 'fb/fb_notifications.dart';
import 'firebase_options.dart';
import 'models/Noti.dart';


// final _configration = PurchasesConfiguration('appl_PPJNQKdiNuamcZQOnzAsnHckdhC');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Purchases.configure(_configration);
  await AppSettingsPreferences.init();
  Noti.initialize(
    FlutterLocalNotificationsPlugin(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FbNotifications.initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            debugShowCheckedModeBanner: false,
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/start_screen': (context) => const StartScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              '/paid_video': (context) => const PayVideoScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/enter_email_screen': (context) => const EnterEmailScreen(),
              '/pay_screen': (context) => const PayScreen(),
              '/bn_screen': (context) => const BottomNavigationScreen(),
              '/privacy_policy_screen': (context) => const PrivacyPolicy(),
            });
      },
    );
  }
}
