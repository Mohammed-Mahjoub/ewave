import 'package:ewave/api/controllers/auth_controller.dart';
import 'package:ewave/models/login.dart';
import 'package:ewave/shared_preferences/shared_preferences.dart';
import 'package:ewave/util/helpers.dart';
import 'package:ewave/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
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
          'Login',
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
            'Enter your email and password to login',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          AppTextField(
            hintText: 'Enter Your Email ',
            keyboardType: TextInputType.emailAddress,
            textEditingController: _emailEditingController,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hintText: 'Enter Your Password',
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
          SizedBox(height: 50.h),
          AppButton(
            text: 'Log in',
            onPress: () async {
              if (isFullData()) {
                LogIn? logInUser = await AuthController().logIn(
                    email: _emailEditingController.text,
                    password: _passwordEditingController.text);
                if (context.mounted) {
                  if (logInUser != null) {
                    AppSettingsPreferences.saveUser(
                        user: logInUser.data!.user!);
                    AppSettingsPreferences.saveToken(token: logInUser.token!);
                    Navigator.pushReplacementNamed(context, '/bn_screen');
                  } else {
                    context.showSnackBar(
                        message: 'The password or email is wrong', error: true);
                  }
                }
              } else {
                context.showSnackBar(
                    message: 'Enter the required data', error: true);
              }
            },
          ),
          SizedBox(height: 10.h),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/enter_email_screen');
              },
              child: Text(
                'Forget Password?',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 12.sp),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t Have An Account?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_screen');
                },
                child: Text(
                  ' Sign Up',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 14.sp),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool isFullData() {
    if (_emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
