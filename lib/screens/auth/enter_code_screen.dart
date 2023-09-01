import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_text_field.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  late TextEditingController _codeEditingController;

  @override
  void initState() {
    super.initState();
    _codeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _codeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF407bda),
        elevation: 0,
        title: Text(
          'Enter Code',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
        children: [
          Text(
            'Enter Your Code Reserved On Your Email',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            hintText: 'Enter Your Code',
            keyboardType: TextInputType.emailAddress,
            textEditingController: _codeEditingController,
          ),
          SizedBox(height: 34.h),
          AppButton(
            text: 'Next',
            onPress: () =>
                Navigator.pushNamed(context, '/forget_password_screen'),
          ),
        ],
      ),
    );
  }
}
