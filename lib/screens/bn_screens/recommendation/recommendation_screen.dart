import 'package:ewave/screens/bn_screens/recommendation/single_recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../api/controllers/recommedations_controller.dart';

class RecommendationScreen extends StatefulWidget {
  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();

  const RecommendationScreen({super.key});
}

class _RecommendationScreenState extends State<RecommendationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecommedationsController().getAllRecommedations(),
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
                              SingleRecommendationScreen(snapshot.data![index]),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 24.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      Moment(
                                        DateTime.parse(
                                            snapshot.data![index].openingTime!),
                                      ).format("MMMM, Do").toString(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Colors.grey.shade200,
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
                                              : snapshot.data![index].status! ==
                                                      1
                                                  ? 'active'
                                                  : 'expired',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        snapshot.data![index].status! == 1
                                            ? SpinKitThreeBounce(
                                                color: Colors.green,
                                                size: 10,
                                                controller: AnimationController(
                                                    vsync: this,
                                                    duration: const Duration(
                                                        milliseconds: 1200)),
                                              )
                                            : SizedBox(height: 0.h),
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
                                        color: snapshot.data![index]
                                                    .tradeResult! ==
                                                4
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data![index].action!,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      fontSize: 30.sp,
                                      color: snapshot.data![index].action! ==
                                              'Sell'
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].tradeStyle! == 0
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
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
    );
  }
}
