import 'package:ewave/screens/bn_screens/blog/blog_screen.dart';
import 'package:ewave/screens/bn_screens/paid_recommendation/markets_paid_screen.dart';
import 'package:ewave/screens/bn_screens/recommendation/recommendation_screen.dart';
import 'package:ewave/screens/bn_screens/video/video_screen.dart';
import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moment_dart/moment_dart.dart';
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
      const BnScreen(title: 'Market Analysis', widget: RecommendationScreen()),
      const BnScreen(title: 'EWave Forecast', widget: MarketsPaidScreen()),
      const BnScreen(title: 'Trading library', widget: VideoScreen()),
      const BnScreen(title: 'Blog', widget: BlogScreen()),
    ];
    return Scaffold(
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
        elevation: 0,
        title: Row(
          children: [
            Text(
              screens[_selectedPageIndex].title,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            screens[_selectedPageIndex].title == 'EWave Forecast'
                ? const Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                : SizedBox(height: 0.h),
          ],
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
          backgroundColor: const Color(0XFFFDB827),
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
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/chart.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/chart.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Text('VIP',style: GoogleFonts.poppins(fontSize: 20.sp,color: Colors.white,),),
              icon: Text('VIP',style: GoogleFonts.poppins(fontSize: 20.sp,color: Colors.white,),),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/video.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/video.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/blog.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                'assets/blog.svg',
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
              label: '',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: 305.w,
        backgroundColor: const Color(0XFF1b1b1c),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                color: const Color(0XFFFDB827),
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
                            AppSettingsPreferences().user().email!.substring(0,10)+'...',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppSettingsPreferences().user().role!,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
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
                      const Icon(
                        Icons.policy_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/pay_screen');
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.credit_card_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      AppSettingsPreferences().user().expire_payment != '' ?
                      Text(
                        'Pay End on: ',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ):Text(
                        'Pay',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          AppSettingsPreferences().user().expire_payment != '' ?
                        Moment(
                          DateTime.parse(AppSettingsPreferences().user().expire_payment!),
                        ).format("MMMM, Do").toString() : '',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
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
                    AppSettingsPreferences.putString(
                        key: PrefKeys.token.name, value: '');
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
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
