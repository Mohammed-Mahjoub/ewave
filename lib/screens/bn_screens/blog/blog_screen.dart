import 'package:cached_network_image/cached_network_image.dart';
import 'package:ewave/api/controllers/articles_controller.dart';
import 'package:ewave/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ArticlesController().getAllArticles(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child:  CircularProgressIndicator(color: Colors.blue,),);
        }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].title!,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
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
                        const Divider(color: Colors.black),
                        Image.network(
                          snapshot.data![index].image!,
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            snapshot.data![index].content!,
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
        }else{
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
