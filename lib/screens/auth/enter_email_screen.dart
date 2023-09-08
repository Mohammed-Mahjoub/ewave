import 'package:ewave/api/controllers/auth_controller.dart';
import 'package:ewave/screens/auth/enter_code_screen.dart';
import 'package:ewave/util/helpers.dart';
import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/app_text_field.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({Key? key}) : super(key: key);

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
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
      backgroundColor: const Color(0XFF1b1b1c),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFDB827),
        elevation: 0,
        title: Text(
          'Enter Email',
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
            'Enter Your Email To Reset Password',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
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
            text: 'Next',
            onPress: () async {
              if (isFullData()) {
                bool isSendCode = await AuthController()
                    .forgotPassword(email: _emailEditingController.text);

                if (context.mounted) {
                  if (isSendCode) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EnterCodeScreen(_emailEditingController.text);
                      },
                    ));
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
