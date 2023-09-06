import 'package:ewave/screens/bn_screens/paid_recommendation/paid_recommendation_screen.dart';
import 'package:ewave/screens/bn_screens/recommendation/recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/controllers/categories_controller.dart';

class MarketsPaidScreen extends StatefulWidget {
  const MarketsPaidScreen({Key? key}) : super(key: key);

  @override
  State<MarketsPaidScreen> createState() => _MarketsPaidScreenState();
}

class _MarketsPaidScreenState extends State<MarketsPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DisplayVideoScreen(
              //           post: Post(
              //         snapshot.data![index].title!,
              //         snapshot.data![index].url!,
              //         snapshot.data![index].description!,
              //       )),
              //     ));
              Navigator.pushNamed(context, '/paid_video');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 200.h,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 150.h,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: FutureBuilder(
            future: CategoriesController().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PaidRecommendationScreen(
                                  snapshot.data![index].sId!,
                                  snapshot.data![index].name!);
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            Image.network(
                              snapshot.data![index].image!,
                              height: 100.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              snapshot.data![index].name!,
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 150 / 130),
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
        ),
      ],
    );
  }
}
