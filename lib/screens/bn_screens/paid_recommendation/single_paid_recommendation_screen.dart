import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../models/recommendations.dart';

class SinglePaidRecommendationScreen extends StatefulWidget {
  final Recommendations? recommendations;

  const SinglePaidRecommendationScreen({required this.recommendations,super.key});

  @override
  State<SinglePaidRecommendationScreen> createState() => _SinglePaidRecommendationScreenState();
}

class _SinglePaidRecommendationScreenState extends State<SinglePaidRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
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
          InkWell(
            onTap: (){
              final imageProvider = Image.network(widget.recommendations!.image!).image;
              showImageViewer(context, imageProvider, onViewerDismissed: () {
                print("dismissed");
              });
            },
            child: Image.network(
              widget.recommendations!.image!,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Action:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.action!,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: widget.recommendations!.action! == 'Sell'
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'status:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Opening Time:',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Moment(
                          DateTime.parse(widget.recommendations!.openingTime!),
                        ).format("MMMM, Do dddd A hh:mm").toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Trade Style:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Risk per Trade:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.riskPerTrade!.toString() + '%',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Open price:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.blue,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.openPrice!.toString(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Target Price 1:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.green,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.firstTargetPrice!.toString(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Target Price 2:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.green,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.secondTargetPrice!.toString(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Stop Loss:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.recommendations!.stopLoss!.toString(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Trade Result:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Expird Time:',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.recommendations!.expireTime!,
                        // Moment(
                        //   DateTime.parse(widget.recommendations!.expireTime!),
                        // ).format("MMMM, Do dddd A hh:mm").toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Historical win rate:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.recommendations!.winRate!}%',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'last update Time:',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Moment(
                          DateTime.parse(widget.recommendations!.lastUpdate!),
                        ).format("MMMM, Do dddd A hh:mm").toString(),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.multiline_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Comment:',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.recommendations!.comment!,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.white,
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
