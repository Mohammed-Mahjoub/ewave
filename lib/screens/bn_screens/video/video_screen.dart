import 'package:ewave/api/controllers/videos_controller.dart';
import 'package:ewave/models/post.dart';
import 'package:ewave/screens/bn_screens/video/display_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VideosController().getAllVideos(),
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
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.shade50,
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.black),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisplayVideoScreen(
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
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            snapshot.data![index].description!,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}