import 'package:ewave/screens/bn_screens/blog/blog_screen.dart';
import 'package:ewave/screens/bn_screens/paid_recommendation/markets_paid_screen.dart';
import 'package:ewave/screens/bn_screens/paid_recommendation/paid_recommendation_screen.dart';
import 'package:ewave/screens/bn_screens/recommendation/markets_unpaid_screen.dart';
import 'package:ewave/screens/bn_screens/recommendation/recommendation_screen.dart';
import 'package:ewave/screens/bn_screens/video/video_screen.dart';
import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/bn_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<BnScreen> screens = <BnScreen>[
      const BnScreen(title: 'Blog', widget: BlogScreen()),
      const BnScreen(title: 'Video', widget: VideoScreen()),
      const BnScreen(title: 'Recommendations', widget: MarketsScreen()),
      const BnScreen(
          title: 'Paid recommendations', widget: MarketsPaidScreen()),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF407bda),
        elevation: 0,
        title: Text(
          screens[_selectedPageIndex].title,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: screens[_selectedPageIndex].widget,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        child: BottomNavigationBar(
          onTap: (int selectedPageIndex) {
            setState(() => _selectedPageIndex = selectedPageIndex);
          },
          currentIndex: _selectedPageIndex,
          backgroundColor: const Color(0XFF407bda),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          selectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
          ),
          selectedFontSize: 10.sp,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedLabelStyle: GoogleFonts.cairo(
            fontSize: 10.sp,
          ),
          unselectedFontSize: 10.sp,
          iconSize: 24,
          elevation: 20,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                size: 30,
              ),
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.play_arrow,
                size: 30,
              ),
              icon: Icon(
                Icons.play_arrow_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.receipt,
                size: 30,
              ),
              icon: Icon(
                Icons.receipt_long_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.recommend,
                size: 30,
              ),
              icon: Icon(
                Icons.recommend_outlined,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: 305.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                color: const Color(0XFF407bda),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: const AssetImage('assets/logo.png'),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppSettingsPreferences().user().name!,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppSettingsPreferences().user().role!,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/privacy_policy_screen');
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.policy_outlined),
                      SizedBox(width: 10.w),
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                        Uri.parse(
                            'https://play.google.com/store/apps/details?id=my_teacher.com.my_teacher'),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.credit_card_outlined),
                      SizedBox(width: 10.w),
                      Text(
                        'Paid',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () async {
                    AppSettingsPreferences.putString(key: PrefKeys.token.name, value: '');
                   Navigator.pushNamedAndRemoveUntil(context, '/login_screen',(route) => true,);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.logout,color: Colors.red,),
                      SizedBox(width: 10.w),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
