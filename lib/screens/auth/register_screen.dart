import 'package:ewave/util/helpers.dart';
import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/controllers/auth_controller.dart';
import '../../widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _fnameEditingController;
  late TextEditingController _lnameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _confirmPasswordEditingController;
  late TextEditingController _mobileEditingController;

  bool _obscure = true;
  bool _obscure2 = true;

  @override
  void initState() {
    super.initState();
    _fnameEditingController = TextEditingController();
    _lnameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _confirmPasswordEditingController = TextEditingController();
    _mobileEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _fnameEditingController.dispose();
    _lnameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _confirmPasswordEditingController.dispose();
    _mobileEditingController.dispose();
    super.dispose();
  }

  void getSpecialty() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF407bda),
        elevation: 0,
        title: Text(
          'Register',
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
            'create your account , it takes less than a minute',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            hintText: 'Enter Your First Name ',
            keyboardType: TextInputType.text,
            textEditingController: _fnameEditingController,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: 'Enter Your Last Name ',
            keyboardType: TextInputType.text,
            textEditingController: _lnameEditingController,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: 'Enter Your Email ',
            keyboardType: TextInputType.emailAddress,
            textEditingController: _emailEditingController,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: ' Mobile Number',
            keyboardType: TextInputType.phone,
            textEditingController: _mobileEditingController,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: 'Enter Your Password',
            keyboardType: TextInputType.text,
            obscure: _obscure,
            textEditingController: _passwordEditingController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _obscure = !_obscure);
              },
              icon: Icon(
                _obscure ? Icons.visibility : Icons.visibility_off_outlined,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: 'Confirm Your Password',
            keyboardType: TextInputType.text,
            obscure: _obscure2,
            textEditingController: _confirmPasswordEditingController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _obscure2 = !_obscure2);
              },
              icon: Icon(
                _obscure2 ? Icons.visibility : Icons.visibility_off_outlined,
              ),
            ),
          ),
          SizedBox(height: 50.h),
          AppButton(
            text: 'Sign up',
            onPress: () async {
              if(isFullData()){
                bool register = await AuthController().register(
                  email: _emailEditingController.text,
                  name: '${_fnameEditingController.text} ${_lnameEditingController.text}',
                  mobileNumber: _mobileEditingController.text,
                  password: _passwordEditingController.text,
                  passwordConfirm: _confirmPasswordEditingController.text,
                );
                if (context.mounted) {
                  if (register) {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  } else {
                    context.showSnackBar(
                        message: 'The password or email is wrong', error: true);
                  }
                }
              }else{
                context.showSnackBar(
                    message: 'Enter the required data', error: true);
              }

            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Have An Account?',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  ' Sign in',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isFullData(){
    if(
    _emailEditingController.text.isNotEmpty &&
    _mobileEditingController.text.isNotEmpty &&
    _fnameEditingController.text.isNotEmpty &&
    _lnameEditingController.text.isNotEmpty &&
    _passwordEditingController.text.isNotEmpty &&
    _confirmPasswordEditingController.text.isNotEmpty
    ){
      return true;
    }else{
      return false;
    }

  }
}