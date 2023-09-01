import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
                      'Test Title',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.black),
                  Image.asset(
                    'assets/1.jpeg',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title Test Title',
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
  }
}
