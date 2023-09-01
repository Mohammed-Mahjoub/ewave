import 'package:ewave/screens/bn_screens/paid_recommendation/single_paid_recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaidRecommendationScreen extends StatefulWidget {
  const PaidRecommendationScreen({super.key});

  @override
  State<PaidRecommendationScreen> createState() => _PaidRecommendationScreenState();
}

class _PaidRecommendationScreenState extends State<PaidRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.h),
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SinglePaidRecommendationScreen(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Row(
                  children: [
                    const Icon(Icons.bar_chart, size: 70),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AUSDUSDT',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Active',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Waiting',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '10/11/2020 11:30',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Buy',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
