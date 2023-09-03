import 'package:ewave/util/helpers.dart';
import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/controllers/auth_controller.dart';
import '../../widgets/app_text_field.dart';
import 'forget_password_screen.dart';

class EnterCodeScreen extends StatefulWidget {

   String? email;


   EnterCodeScreen(this.email);

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
            onPress: () async {
              if(isFullData()){
                bool isSendCode = await AuthController().verifyCode(email: widget.email!,code:_codeEditingController.text);

                if (context.mounted) {
                  if(isSendCode){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ForgetPasswordScreen(widget.email!);
                    },));
                  }else{
                    context.showSnackBar(message: 'Code is wrong', error: true);
                  }
                }
              }else{
                context.showSnackBar(message: 'Enter the required data', error: true);
              }


            },
          ),
        ],
      ),
    );
  }
  bool isFullData() {
    if (_codeEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
