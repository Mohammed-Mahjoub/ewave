import 'package:ewave/api/controllers/videos_controller.dart';
import 'package:ewave/models/post.dart';
import 'package:ewave/screens/bn_screens/paid_recommendation/display_pay_video.dart';
import 'package:ewave/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/controllers/pay_controller.dart';
import '../../../widgets/app_button.dart';

class PayVideoScreen extends StatefulWidget {
  const PayVideoScreen({super.key});

  @override
  State<PayVideoScreen> createState() => _PayVideoScreenState();
}

class _PayVideoScreenState extends State<PayVideoScreen> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
        elevation: 0,
        title: Text(
          'Paid Videos',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: VideosController().getAllVideosPay(),
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
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0XFF1F2937),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                snapshot.data![index].title!,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Divider(color: Colors.black),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DisplayPayVideoScreen(
                                          post: Post(
                                            snapshot.data![index].title!,
                                            snapshot.data![index].url!,
                                            snapshot.data![index].description!,
                                          )),
                                    ));
                              },
                              child: Container(
                                color: Colors.grey,
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }else if(snapshot.data == null){
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        val = !val;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: val,
                          onChanged: (value) {
                            setState(() {
                              val = !val;
                            });
                          },
                        ),
                        Text(
                          'Accept privacy policy',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppButton(
                      text: 'Pay',
                      fontSize: 18.sp,
                      onPress: () async {
                        if(val==true){
                          String? response = await PayController().pay();
                          if (response != null) {
                            Navigator.pop(context);
                            await launchUrl(
                              Uri.parse(response),
                              mode: LaunchMode.externalApplication,
                            );
                            Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => true);
                          } else {
                            context.showSnackBar(message: 'Something went wrong', error: true);
                          }
                        }else{
                          context.showSnackBar(message: 'Enter on check box', error: true);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );

          }
          else {
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
