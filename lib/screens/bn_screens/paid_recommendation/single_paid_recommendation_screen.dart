import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SinglePaidRecommendationScreen extends StatefulWidget {
  const SinglePaidRecommendationScreen({super.key});

  @override
  State<SinglePaidRecommendationScreen> createState() => _SinglePaidRecommendationScreenState();
}

class _SinglePaidRecommendationScreenState extends State<SinglePaidRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF407bda),
        elevation: 0,
        title: Text(
          'BUSDUSDT',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/1.jpeg',
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Action:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Buy',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'status:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Active',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Opening Time:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '8/31/23 15:08',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Trade Style:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Swing Trade',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Risk per Trade:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '2%',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Open price:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '94.225',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Target Price 1:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '94.53',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Target Price 2:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '95.3',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Stop Loss:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '94',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Trade Result:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'waiting',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Expird Time:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '3 Days	',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Historical win rate:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '170%',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'last update Time:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '9/1/23 15:08',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Text(
                      'Comment:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Confirm @ Break out',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
