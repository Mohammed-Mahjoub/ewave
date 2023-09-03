import 'package:ewave/screens/auth/login_screen.dart';
import 'package:ewave/util/helpers.dart';
import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/controllers/auth_controller.dart';
import '../../widgets/app_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  String? email;


  ForgetPasswordScreen(this.email, {super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _passwordEditingController;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _passwordEditingController = TextEditingController();

  }

  @override
  void dispose() {
    _passwordEditingController.dispose();
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
          'Forget Password',
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
            'Reset Your Password here',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            hintText: 'Enter New Password',
            keyboardType: TextInputType.text,
            obscure: _obscure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _obscure = !_obscure);
              },
              icon: Icon(
                _obscure ? Icons.visibility : Icons.visibility_off_outlined,
              ),
            ),
            textEditingController: _passwordEditingController,
          ),
          SizedBox(height: 20.h),
          SizedBox(height: 34.h),
          AppButton(
            text: 'Reset Password',
            onPress: () async {
              if(isFullData()){
                bool isSendCode = await AuthController().resetPassword(email: widget.email!,newPassword:_passwordEditingController.text );

                if (context.mounted) {
                  if(isSendCode){
                    Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => true);
                  }else{
                    context.showSnackBar(message: 'wrong', error: true);
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
    if (_passwordEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
