import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/recommendations.dart';

class SingleRecommendationScreen extends StatefulWidget {
  Recommendations? recommendations;

  @override
  State<SingleRecommendationScreen> createState() =>
      _SingleRecommendationScreenState();

  SingleRecommendationScreen(this.recommendations, {super.key});
}

class _SingleRecommendationScreenState
    extends State<SingleRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF407bda),
        elevation: 0,
        title: Text(
          widget.recommendations!.name!,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            widget.recommendations!.image!,
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
                      widget.recommendations!.action!,
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
                      widget.recommendations!.status! == 0
                          ? 'pending'
                          : widget.recommendations!.status! == 1
                              ? 'active'
                              : 'expired',
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
                      DateFormat.yMd().add_jm().format(
                          DateTime.parse(widget.recommendations!.openingTime!)),
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
                      widget.recommendations!.tradeStyle! == 0
                          ? 'Swing Trade'
                          : 'Interday',
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
                      widget.recommendations!.riskPerTrade!.toString() + '%',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 2,color: Colors.black,),
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
                      widget.recommendations!.openPrice!.toString(),
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
                      widget.recommendations!.firstTargetPrice!.toString(),
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
                      widget.recommendations!.secondTargetPrice!.toString(),
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
                      widget.recommendations!.stopLoss!.toString(),
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
                      widget.recommendations!.tradeResult! == 0
                          ? 'waiting'
                          : widget.recommendations!.tradeResult! == 1
                              ? 'Break even'
                              : widget.recommendations!.tradeResult! == 2
                                  ? 'Target 1'
                                  : widget.recommendations!.tradeResult! == 3
                                      ? 'Target 2'
                                      : 'Stop loss',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 2,color: Colors.black,),
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
                      widget.recommendations!.expireTime!,
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
                      '${widget.recommendations!.winRate!}%',
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
                      DateFormat.yMd().add_jm().format(
                          DateTime.parse(widget.recommendations!.lastUpdate!)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.multiline_chart),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Comment:',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.recommendations!.comment!,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
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
