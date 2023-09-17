import 'package:ewave/api/controllers/pay_controller.dart';
import 'package:ewave/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/app_button.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  late TextEditingController _emailEditingController;
  bool val = false;

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
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
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
              color: Colors.white,
            ),
          ),
          // SizedBox(height: 10.h),
          // AppTextField(
          //   hintText: 'Enter Your Email',
          //   keyboardType: TextInputType.emailAddress,
          //   textEditingController: _emailEditingController,
          // ),
          SizedBox(height: 50.h),
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
                  side: BorderSide(color: Colors.white),
                ),
                Text(
                  'Accept privacy policy',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                // const Spacer(),
                // TextButton(
                //   onPressed: () {
                //     _showBottomSheet(context);
                //   },
                //   child: Text(
                //     AppLocalizations.of(context)!.forget_password,
                //     style: GoogleFonts.poppins(
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          AppButton(
            text: 'Pay',
            fontSize: 18.sp,
            onPress: () async {
              if (val == true) {
                String? response = await PayController().pay();
                if (response != null) {
                  Navigator.pop(context);
                  await launchUrl(
                    Uri.parse(response),
                    mode: LaunchMode.externalApplication,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login_screen', (route) => true);
                } else {
                  context.showSnackBar(
                      message: 'Something went wrong', error: true);
                }
              } else {
                context.showSnackBar(
                    message: 'Enter on check box', error: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
