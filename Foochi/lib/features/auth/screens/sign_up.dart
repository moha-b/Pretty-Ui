import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/auth/screens/widgets/auth_field.dart';
import 'package:foochi/features/auth/screens/widgets/social_icons_row.dart';
import 'package:get/get.dart';

import '../../landing/landing_page.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Center(child: Image.asset(AppAssets.kAppLogo)),
                SizedBox(height: 30.h),
                Text('Sign Up',
                    style: AppTypography.kBold30
                        .copyWith(color: AppColors.kSecondary)),
                SizedBox(height: 24.h),
                SocialIconRow(
                  facebookCallback: () {
                    debugPrint('Facebook');
                  },
                  googleCallback: () {
                    debugPrint('Google');
                  },
                  twitterCallback: () {
                    debugPrint('Twitter');
                  },
                ),
                SizedBox(height: 30.h),
                AuthField(
                  controller: _usernameController,
                  hintText: 'Your Username',
                  isFieldValidated: isNameCorrect,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    isNameCorrect = validateName(value);
                    setState(() {});
                  },
                  validator: (value) {
                    if (!validateName(value!)) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                AuthField(
                  controller: _emailController,
                  hintText: 'Your Email',
                  keyboardType: TextInputType.emailAddress,
                  isFieldValidated: isEmailCorrect,
                  onChanged: (value) {
                    setState(() {});
                    isEmailCorrect = validateEmail(value);
                  },
                  validator: (value) {
                    if (!validateEmail(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                AuthField(
                  hintText: 'Your Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                        .hasMatch(value)) {
                      return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoading();
                        await Future.delayed(const Duration(seconds: 3));
                        hideLoading();
                        Get.offAll(() => const LandingPage());
                      }
                    },
                    text: 'Sign Up'),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?',
                        style: AppTypography.kLight14.copyWith(
                          color: AppColors.kSecondary,
                        )),
                    CustomTextButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Sign In',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final nameRegex = RegExp(r'^[a-zA-Z]+$');
      return nameRegex.hasMatch(value);
    }
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(value);
    }
  }
}
