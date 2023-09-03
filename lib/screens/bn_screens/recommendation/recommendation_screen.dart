import 'package:ewave/screens/bn_screens/recommendation/single_recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../api/controllers/recommedations_controller.dart';

class RecommendationScreen extends StatefulWidget {
  String? id;
  String? name;

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();

  RecommendationScreen(this.id, this.name, {super.key});
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF407bda),
          elevation: 0,
          title: Text(
            'Recommendations For ${widget.name}',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder(
          future: RecommedationsController().getAllRecommedations(widget.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SingleRecommendationScreen(snapshot.data![index]),
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
                              // Image.network(snapshot.data![index].image!,height: 70.h,width: 70.w,fit: BoxFit.cover,),
                              SizedBox(width: 10.w),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].status! == 0 ? 'pending' :  snapshot.data![index].status! == 1 ? 'active': 'expired',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].tradeResult! == 0 ? 'waiting' :  snapshot.data![index].tradeResult! == 1 ? 'Break even':snapshot.data![index].tradeResult! == 2 ? 'Target 1' :snapshot.data![index].tradeResult! == 3 ? 'Target 2': 'Stop loss',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMd().add_jm().format(DateTime.parse(snapshot.data![index].createdAt!)),
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
                                snapshot.data![index].action!,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: snapshot.data![index].action! == 'Sell' ?Colors.red : Colors.green,
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
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,size: 50.sp,),
                    SizedBox(height: 20.h,),
                    const Text('No Data'),
                  ],
                ),
              );
            }
          },
        )
        // body: ListView.builder(
        //   padding: EdgeInsets.only(top: 10.h),
        //   itemCount: 10,
        //   shrinkWrap: true,
        //   physics: const BouncingScrollPhysics(),
        //   itemBuilder: (context, index) {
        //     return InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const SingleRecommendationScreen(),
        //             ));
        //       },
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16.w),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15.r),
        //           ),
        //           child: Padding(
        //             padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        //             child: Row(
        //               children: [
        //                 const Icon(Icons.bar_chart, size: 70),
        //                 SizedBox(width: 10.w),
        //                 Expanded(
        //                   flex: 3,
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'AUSDUSDT',
        //                         textAlign: TextAlign.start,
        //                         style: GoogleFonts.poppins(
        //                           fontSize: 16.sp,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                       Text(
        //                         'Active',
        //                         textAlign: TextAlign.start,
        //                         style: GoogleFonts.poppins(
        //                           fontSize: 14.sp,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                       Text(
        //                         'Waiting',
        //                         textAlign: TextAlign.start,
        //                         style: GoogleFonts.poppins(
        //                           fontSize: 14.sp,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                       Text(
        //                         '10/11/2020 11:30',
        //                         textAlign: TextAlign.start,
        //                         style: GoogleFonts.poppins(
        //                           fontSize: 14.sp,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 const Spacer(),
        //                 Text(
        //                   'Buy',
        //                   textAlign: TextAlign.start,
        //                   style: GoogleFonts.poppins(
        //                     fontSize: 16.sp,
        //                     color: Colors.black,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
