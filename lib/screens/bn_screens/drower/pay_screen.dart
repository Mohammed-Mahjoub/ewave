import 'package:ewave/api/controllers/pay_controller.dart';
import 'package:ewave/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  late TextEditingController _emailEditingController;

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
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
          'Pay Screen',
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
          Image.asset(
            'assets/paypal.png',
            height: 200.h,
          ),
          Text(
            'Enter Your Email To Pay 120\$ For The Paid Subscription',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            hintText: 'Enter Your Email',
            keyboardType: TextInputType.emailAddress,
            textEditingController: _emailEditingController,
          ),
          SizedBox(height: 50.h),
          AppButton(
            text: 'Pay',
            onPress: () async {
              if (isFullData()) {
                String? response = await PayController()
                    .pay(email: _emailEditingController.text);
                if (context.mounted) {
                  if (response != null) {
                    context.showSnackBar(
                        message: 'Done Successfully', error: false);
                    Navigator.pop(context);
                  } else {
                    context.showSnackBar(
                        message: 'email is wrong', error: true);
                  }
                }
              } else {
                context.showSnackBar(
                    message: 'Enter the required data', error: true);
              }
            },
          ),
        ],
      ),
    );
  }

  bool isFullData() {
    if (_emailEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
