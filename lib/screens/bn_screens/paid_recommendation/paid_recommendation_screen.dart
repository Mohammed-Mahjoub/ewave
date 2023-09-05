import 'package:ewave/screens/bn_screens/paid_recommendation/single_paid_recommendation_screen.dart';
import 'package:ewave/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/controllers/pay_controller.dart';
import '../../../api/controllers/recommedations_controller.dart';
import '../../../widgets/app_button.dart';
import '../recommendation/single_recommendation_screen.dart';

class PaidRecommendationScreen extends StatefulWidget {
  String? id;
  String? name;

  PaidRecommendationScreen(this.id, this.name);

  @override
  State<PaidRecommendationScreen> createState() =>
      _PaidRecommendationScreenState();
}

class _PaidRecommendationScreenState extends State<PaidRecommendationScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
        elevation: 0,
        title: Text(
          'Recommendations For ${widget.name}',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: RecommedationsController().getAllRecommedationsPaid(widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SinglePaidRecommendationScreen(
                              recommendations: snapshot.data![index],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        color: const Color(0XFF1F2937),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.h, horizontal: 16.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      Moment(
                                        DateTime.parse(
                                            snapshot.data![index].openingTime!),
                                      ).format("MMMM, Do dddd A hh:mm").toString(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data![index].status! == 0
                                              ? 'pending'
                                              : snapshot.data![index].status! == 1
                                                  ? 'active'
                                                  : 'expired',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        snapshot.data![index].status! == 1 ? SpinKitThreeBounce(
                                          color: Colors.green,
                                          size: 10,
                                          controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                                        ):SizedBox(height: 0.h),
                                      ],
                                    ),
                                    Text(
                                      snapshot.data![index].tradeResult! == 0
                                          ? 'waiting'
                                          : snapshot.data![index]
                                                      .tradeResult! ==
                                                  1
                                              ? 'Break even'
                                              : snapshot.data![index]
                                                          .tradeResult! ==
                                                      2
                                                  ? 'Target 1'
                                                  : snapshot.data![index]
                                                              .tradeResult! ==
                                                          3
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
                              ),
                              Text(
                                snapshot.data![index].action!,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: snapshot.data![index].action! == 'Sell'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50.sp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'You Need To Subscribe for this',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Enter Your Email To Pay 120\$ For The Paid Subscription',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppButton(
                      text: 'Pay',
                      onPress: () async {
                        String? response = await PayController().pay();
                        if (response != null) {
                          Navigator.pop(context);
                          await launchUrl(
                            Uri.parse(response),
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          context.showSnackBar(
                              message: 'Something went wrong', error: true);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text('No Data'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
